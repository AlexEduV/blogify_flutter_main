import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_comment_provider.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_user_provider.dart';
import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/circled_button_outlined.dart';
import 'package:blogify_flutter_main/presentation/pages/comments_page/widgets/comments_list_tile.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

    //todo: switch to multiline text field when the chars are not fitting
    //todo: test page top bar with a long title. It should be clipped with 3 dots

    //todo: test with a larger number of comments. Scroll view might be needed.
    // And when I scroll, I should be able to hide the keyboard.


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 24,),

              Row(
                spacing: 16.0,
                children: [

                  CircledButtonOutlined(
                    icon: FontAwesomeIcons.chevronLeft,
                    onTap: () => context.router.popForced(),
                  ),

                  Text(
                    currentPost.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 24,),

              //comment field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    focusNode: commentFieldFocusNode,
                    controller: commentTextController,
                    decoration: const InputDecoration(
                      hintText: 'What are your thoughts?',
                      hintStyle: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 14.0,
                      ),
                      isDense: true,
                    ),

                  ),
                ),
              ),

              const SizedBox(height: 12.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedButton(
                    text: 'Respond',
                    isOpaque: true,
                    onTap: () => validateCommentInput(commentTextController.text),
                    backgroundColor: AppColors.emeraldGreen,
                    tintColor: Colors.white,
                  ),
                ],
              ),

              const SizedBox(height: 24.0),

              //comments or a placeholder
              Expanded(
                child: Consumer<GlobalMockCommentProvider>(
                  builder: (context, notifier, child) {

                    final comments = notifier.filteredComments;
                    final userNotifier = context.read<GlobalMockUserProvider>();

                    //placeholder
                    if (comments.isEmpty) {

                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'No comments yet',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final user = userNotifier.getUserEntityById(comments[index].userId);

                        return CommentsListTile(user: user, comment: comments[index]);

                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 16,),
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

  void validateCommentInput(String input) {

    if (input.isEmpty) {
      return;
    }

    //prepare data
    final date = DateFormat('MM/dd/yy').format(DateTime.now());

    final userNotifier = context.read<GlobalMockUserProvider>();
    final userId = userNotifier.currentUser.id;

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

