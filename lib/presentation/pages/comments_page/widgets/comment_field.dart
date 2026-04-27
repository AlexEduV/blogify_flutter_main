import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
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
      padding: EdgeInsets.zero,
      child: TextField(
        focusNode: focusNode,
        controller: textController,
        maxLines: null,
        decoration: InputDecoration(
          hintText: L10n.commentInputHint,
          hintStyle: const TextStyle(
            color: AppColors.accentColor,
            fontSize: 14.0,
          ),
          isDense: true,
          filled: true,
          fillColor: Colors.white,

          // Default border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.majorS),
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.5,
            ),
          ),

          // Focused border (when tapped)
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.majorS),
            borderSide: const BorderSide(
              color: AppColors.emeraldGreen,
              width: AppDimensions.minorXS,
            ),
          ),

          // Remove default padding around input
          contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.normalM, vertical: AppDimensions.normalS),
        ),
      ),
    );
  }
}
