import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_comment_provider.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_user_provider.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/circled_button_outlined.dart';
import 'package:blogify_flutter_main/presentation/pages/comments_page/widgets/comments_list_tile.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  @override
  void initState() {
    super.initState();

    final notifier = context.read<GlobalMockCommentProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.fetchCommentsByPostId(widget.id);
    });

  }

  @override
  Widget build(BuildContext context) {

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
                    onTap: () {
                      context.router.popForced();
                    },
                  ),

                  const Text(
                    'Back',
                    style: TextStyle(
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
                child: Row(
                  children: [

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
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

                    const RoundedButton(
                      text: 'Respond',
                      isOpaque: true,
                    ),

                  ],
                ),
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
}

