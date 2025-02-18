import 'package:auto_route/annotations.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_comment_provider.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
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

                    return ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {

                        return Row(
                          children: [
                            Text(comments[index].content),
                          ],
                        );

                      }
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

