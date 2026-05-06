import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/common/semantics_labels.dart';
import 'package:blogify_flutter_main/core/di/injection_container.dart';
import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/users/get_user_by_id_use_case.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/comments_page/widgets/comment_field.dart';
import 'package:blogify_flutter_main/presentation/pages/comments_page/widgets/comments_list_tile.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:blogify_flutter_main/presentation/widgets/app_semantics.dart';
import 'package:blogify_flutter_main/presentation/widgets/empty_list_placeholder.dart';
import 'package:blogify_flutter_main/utils/relative_date_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../notifiers/comments_page/comments_page_notifier.dart';
import '../../notifiers/posts/global_mock_storage_provider.dart';
import '../../widgets/circled_button_outlined.dart';

@RoutePage()
class CommentsPage extends StatefulWidget {
  final int postId;

  const CommentsPage({required this.postId, super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final commentTextController = TextEditingController();
  final commentFieldFocusNode = FocusNode();

  late PostEntity currentPost;

  @override
  void initState() {
    super.initState();

    final commentNotifier = context.read<CommentsPageNotifier>();
    final storageNotifier = context.read<GlobalMockStorageProvider>();
    currentPost = storageNotifier.getPostById(widget.postId);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      commentNotifier.fetchCommentsByPostId(widget.postId);
    });
  }

  @override
  void dispose() {
    commentFieldFocusNode.dispose();
    commentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //todo: sorting by most recent and most relevant

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.majorS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.majorS),

              Row(
                spacing: AppDimensions.normalM,
                children: [
                  CircledButtonOutlined(
                    icon: FontAwesomeIcons.chevronLeft,
                    onTap: () => context.router.popForced(),
                    semanticsLabel: SemanticsLabels.backButton,
                  ),
                  Expanded(
                    child: Text(
                      currentPost.title,
                      style: AppTextStyles.sfPro16,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppDimensions.majorS),

              CommentField(focusNode: commentFieldFocusNode, textController: commentTextController),

              const SizedBox(height: AppDimensions.normalS),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppSemantics(
                    label: SemanticsLabels.addCommentButton,
                    child: RoundedButton(
                      text: L10n.commentsRespondButtonTitle,
                      selected: true,
                      onTap: () => addComment(commentTextController.text),
                      selectedColor: AppColors.emeraldGreen,
                      tintColor: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppDimensions.majorS),

              //comments or a placeholder
              Expanded(
                child: Selector<CommentsPageNotifier, List<CommentEntity>>(
                  selector: (context, model) => model.filteredComments,
                  builder: (context, comments, child) {
                    //placeholder
                    if (comments.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppDimensions.minorL),
                        child: EmptyListPlaceholder(text: L10n.emptyCommentSectionPlaceholder),
                      );
                    }

                    return ListView.separated(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final user = serviceLocator<GetUserByIdUseCase>().call(
                          comments[index].userId,
                        );
                        return CommentsListTile(user: user, comment: comments[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: AppDimensions.normalM);
                      },
                      padding: const EdgeInsets.only(bottom: AppDimensions.normalM),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addComment(String input) {
    final commentsProvider = context.read<CommentsPageNotifier>();
    final isValid = commentsProvider.validateComment(input);

    if (!isValid) return;

    //prepare data
    final now = DateTime.now();
    final date = RelativeDateUtil.inputFormat.format(now);

    final userId = context.read<UserDataNotifier>().user.id;

    //update notifier
    commentsProvider.addComment(
      CommentEntity(postId: widget.postId, content: input, date: date, userId: userId),
    );

    commentTextController.clear();
    commentFieldFocusNode.unfocus();
  }
}
