import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/notifiers/category_index_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/empty_posts_placeholder.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/home_bottom_bar.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/home_search_bar.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/post_card.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/user_welcome_row.dart';
import 'package:blogify_flutter_main/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _searchSelectorButtonKey = GlobalKey();

  //todo: firebase authentication (Google, Apple)

  //todo: on the emulator (Pixel 4), the paddings of the card stack are not right,
  // the bottom cards are not visible

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0).copyWith(bottom: 16.0),
          child: Column(
            spacing: 24.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const UserWelcomeRow(),

              //search bar
              HomeSearchBar(
                selectorKey: _searchSelectorButtonKey,
              ),

              //card stack
              Expanded(
                child: Consumer<GlobalMockStorageProvider>(builder: (context, notifier, child) {
                  final posts = notifier.postsFiltered;
                  if (posts.isEmpty) {
                    return const EmptyPostsPlaceholder();
                  }

                  double getTopOffset(int index, double baseOffset) => index * baseOffset;
                  double getScale(int index, double scaleStep) => 1.0 - (index * scaleStep);

                  final visibleCount = 3;
                  final visibleList = posts.take(visibleCount).toList();

                  //post stack
                  return Consumer<CategoryIndexNotifier>(
                      builder: (_, categoryIndexNotifier, child) {
                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentGeometry.topCenter,
                      children: List.generate(visibleList.length, (index) {
                        final post = visibleList[index];

                        return AnimatedPositioned(
                          key: ValueKey(post.id),
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          top: getTopOffset(index, 65),
                          left: 0,
                          right: 0,
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            scale: getScale(index, 0.2),
                            child: Dismissible(
                              key: ValueKey(post.id),
                              direction: DismissDirection.vertical,
                              onDismissed: (direction) {
                                notifier.removePostById(post.id);

                                Future.delayed(const Duration(milliseconds: 400), () {
                                  notifier.addPostBack(post);
                                });
                              },
                              child: PostCard(
                                post: post,
                                onTap: openArticlePage,
                              ),
                            ),
                          ),
                        );
                      }).reversed.toList(),
                    );
                  });
                }),
              ),

              const HomeBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  void openArticlePage(int id) {
    context.router.push(ArticleRoute(
      id: id,
    ));
  }
}
