import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommentField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textController;

  const CommentField({
    required this.focusNode,
    required this.textController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: TextField(
        focusNode: focusNode,
        controller: textController,
        decoration: InputDecoration(
          hintText: 'What are your thoughts?',
          hintStyle: const TextStyle(
            color: AppColors.accentColor,
            fontSize: 14.0,
          ),
          isDense: true,
          filled: true,
          fillColor: Colors.white,

          // Default border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1.5,
            ),
          ),

          // Focused border (when tapped)
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: const BorderSide(
              color: AppColors.emeraldGreen,
              width: 2.0,
            ),
          ),

          // Remove default padding around input
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),

      ),
    );
  }
}
