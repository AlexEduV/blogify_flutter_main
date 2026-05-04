import 'package:auto_route/annotations.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/core/di/injection_container.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_post_by_id_use_case.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PublishedArticlesPage extends StatelessWidget {
  const PublishedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(L10n.publishedArticlesPageTitle), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.normalS,
          horizontal: AppDimensions.normalM,
        ),
        child: Consumer<UserDataNotifier>(
          builder: (context, notifier, child) {
            final list = notifier.user.publishedArticles;

            if (list.isEmpty) {
              return const Text(L10n.publishedArticlesPageEmptyList, style: AppTextStyles.sfPro16);
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                final articleId = int.parse(list[index]);
                final article = serviceLocator<GetPostByIdUseCase>().call(articleId);

                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppDimensions.normalS),
                  ),
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
                                image: NetworkImage(article.imageSrc),
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
                                article.title,
                                style: AppTextStyles.sfPro16,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(article.author, maxLines: 1, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: list.length,
            );
          },
        ),
      ),
    );
  }
}
