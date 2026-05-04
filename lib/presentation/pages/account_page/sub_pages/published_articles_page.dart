import 'package:auto_route/annotations.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/core/di/injection_container.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_post_by_id_use_case.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:blogify_flutter_main/presentation/widgets/article_list_item_small.dart';
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
                final postId = int.parse(list[index]);
                final post = serviceLocator<GetPostByIdUseCase>().call(postId);

                return ArticleListItemSmall(postEntity: post);
              },
              itemCount: list.length,
            );
          },
        ),
      ),
    );
  }
}
