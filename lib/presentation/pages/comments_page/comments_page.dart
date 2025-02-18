import 'package:auto_route/annotations.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

          //comment field
          Container(
            child: Row(
              children: [

                TextField(
                  decoration: InputDecoration(
                    hintText: 'What are your thoughts?',
                    hintStyle: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 14.0,
                    ),
                  ),

                ),

                const RoundedButton(text: 'Respond',),

              ],
            ),
          ),

          //comments or a placeholder

        ],
      ),

    );
  }
}

