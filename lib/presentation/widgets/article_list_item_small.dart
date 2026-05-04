import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/router/router.gr.dart';
import 'package:flutter/material.dart';

import '../../common/app_dimensions.dart';
import '../../common/app_text_styles.dart';

class ArticleListItemSmall extends StatelessWidget {
  final PostEntity postEntity;

  const ArticleListItemSmall({required this.postEntity, super.key});

  @override
  Widget build(BuildContext context) {
    final outerBorderRadius = BorderRadius.circular(AppDimensions.normalS);

    return Material(
      color: Colors.white,
      borderRadius: outerBorderRadius,
      child: InkWell(
        borderRadius: outerBorderRadius,
        onTap: () => context.router.push(ArticleRoute(articleId: postEntity.id)),
        child: DecoratedBox(
          decoration: BoxDecoration(borderRadius: outerBorderRadius),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.minorL),
            child: Row(
              spacing: AppDimensions.normalS,
              children: [
                SizedBox(
                  height: AppDimensions.publishedArticleImageSize,
                  width: AppDimensions.publishedArticleImageSize,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(postEntity.imageSrc),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(AppDimensions.minorS),
                    ),
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppDimensions.minorXS,
                    children: [
                      Text(
                        postEntity.title,
                        style: AppTextStyles.sfPro16,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(postEntity.author, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
