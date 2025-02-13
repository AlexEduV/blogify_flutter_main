import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String author;
  final String title;
  final String publishedWhen;
  final String readTimeEstimated;

  const PostCard({
    required this.title,
    required this.author,
    required this.publishedWhen,
    required this.readTimeEstimated,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(width: 8.0, color: Colors.white,),
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [

          //todo: image here
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            height: 270,
            padding: EdgeInsets.all(8.0),
          ),

          SizedBox(height: 16.0,),

          Text(
            author,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),

          SizedBox(height: 4.0),

          Text(
            publishedWhen,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: AppColors.accentColor,
            ),
          ),

          SizedBox(height: 32.0,),

          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 28.0,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 32.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Read Time: ',
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                readTimeEstimated,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.0,),

        ],
      ),
    );
  }
}
