import 'package:auto_route/annotations.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/core/di/injection_container.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_post_by_id_use_case.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/account_page/widgets/empty_article_list_placeholder_page.dart';
import 'package:blogify_flutter_main/presentation/widgets/article_list_item_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LikedArticlesPage extends StatelessWidget {
  const LikedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(L10n.accountItemLikedArticlesTitle), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.normalS,
          horizontal: AppDimensions.normalM,
        ),
        child: Consumer<UserDataNotifier>(
          builder: (context, notifier, child) {
            final articleList = notifier.user.likedArticles;

            if (articleList.isEmpty) {
              return const EmptyArticleListPlaceholderPage(
                icon: Icons.article,
                title: L10n.likedArticlesPageEmptyListTitle,
                subtitle: L10n.likedArticlesPageEmptyListSubtitle,
              );
            }

            return ListView.separated(
              itemBuilder: (context, index) {
                final postId = int.parse(articleList[index]);
                final post = serviceLocator<GetPostByIdUseCase>().call(postId);

                return ArticleListItemSmall(postEntity: post);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: AppDimensions.normalS);
              },
              itemCount: articleList.length,
            );
          },
        ),
      ),
    );
  }
}
