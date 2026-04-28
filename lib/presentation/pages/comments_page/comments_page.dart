import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/core/di/injection_container.dart';
import 'package:blogify_flutter_main/domain/data_sources/users_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/pages/comments_page/widgets/comment_field.dart';
import 'package:blogify_flutter_main/presentation/pages/comments_page/widgets/comments_list_tile.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/global_mock_comment_provider.dart';
import '../../../data/providers/global_mock_storage_provider.dart';
import '../../widgets/circled_button_outlined.dart';

@RoutePage()
class CommentsPage extends StatefulWidget {
  final int id;

  const CommentsPage({
    required this.id,
    super.key,
  });

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

    final commentNotifier = context.read<GlobalMockCommentProvider>();
    final storageNotifier = context.read<GlobalMockStorageProvider>();
    currentPost = storageNotifier.getPostById(widget.id);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      commentNotifier.fetchCommentsByPostId(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    //todo: when I scroll, I should be able to hide the keyboard.
    // - Declined. It's pretty good enough already

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

              CommentField(
                focusNode: commentFieldFocusNode,
                textController: commentTextController,
              ),

              const SizedBox(height: AppDimensions.normalS),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedButton(
                    text: L10n.commentsRespondButtonTitle,
                    filled: true,
                    onTap: () => validateCommentInput(commentTextController.text),
                    backgroundColor: AppColors.emeraldGreen,
                    tintColor: Colors.white,
                  ),
                ],
              ),

              const SizedBox(height: AppDimensions.majorS),

              //comments or a placeholder
              Expanded(
                child: Consumer<GlobalMockCommentProvider>(
                  builder: (context, notifier, child) {
                    final comments = notifier.filteredComments;

                    //placeholder
                    if (comments.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppDimensions.minorL),
                        child: Text(
                          L10n.emptyCommentSectionPlaceholder,
                          style: AppTextStyles.sfPro16,
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final user = serviceLocator<UsersDataSource>()
                            .getUserEntityById(comments[index].userId);

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

  //todo: move to the notifier;
  void validateCommentInput(String input) {
    if (input.isEmpty) {
      return;
    }

    //prepare data
    //todo: move to date formatter
    final date = DateFormat('MM/dd/yy').format(DateTime.now());

    //
    final userId = serviceLocator<UsersDataSource>().getUserEntityById(1).id;

    //update notifier
    final commentsProvider = context.read<GlobalMockCommentProvider>();
    commentsProvider.addComment(
      CommentEntity(
        postId: widget.id,
        content: input,
        date: date,
        userId: userId,
      ),
    );

    //clear the text field
    commentTextController.clear();

    //clear the focus
    commentFieldFocusNode.unfocus();
  }
}
