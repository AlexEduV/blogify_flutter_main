import 'package:auto_route/annotations.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PublishedArticlesPage extends StatelessWidget {
  const PublishedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Published articles'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.normalS,
          horizontal: AppDimensions.normalM,
        ),
        child: Consumer<UserDataNotifier>(
          builder: (context, notifier, child) {
            final list = notifier.user.publishedArticles;

            if (list.isEmpty) {
              return const Text('The list is empty.', style: AppTextStyles.sfPro16);
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                return Text('some article with id: ${list[index]}');
              },
            );
          },
        ),
      ),
    );
  }
}
