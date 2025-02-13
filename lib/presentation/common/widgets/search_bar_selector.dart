import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBarSelector extends StatelessWidget {
  const SearchBarSelector({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: AppColors.secondaryColor,
      ),
      child: Row(
        spacing: 4.0,
        children: [

          Text(
            'Author',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),

          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.black87,
            size: 24,
          )

        ],
      ),
    );
  }
}
