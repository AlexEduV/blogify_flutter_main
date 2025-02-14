import 'package:blogify_flutter_main/presentation/common/widgets/photo_place_holder.dart';
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
        border: Border.all(width: 4.0, color: Colors.white,),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.17),
            blurRadius: 30,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [

          //todo: image here
          const PhotoPlaceHolder(),

          const SizedBox(height: 16.0,),

          Text(
            author,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),

          Text(
            publishedWhen,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: AppColors.accentColor,
            ),
          ),

          const SizedBox(height: 24.0,),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24.0,),

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
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12.0,),

        ],
      ),
    );
  }
}
