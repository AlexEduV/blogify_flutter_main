import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/domain/helpers/category_helper.dart';
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

  //todo: dig into animations to create what you want
  //todo: firebase authentication (Google, Apple)

  //todo: on the emulator (Pixel 4), the paddings of the card stack are not right,
  // the bottom cards are not visible

  @override
  void initState() {
    super.initState();

    final storageNotifier = context.read<GlobalMockStorageProvider>();
    storageNotifier.loadAllInCategory(Category.trending);
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

                  //post stack

                  //todo: this is not correct;
                  // the stack should display (visible) only 3 items,
                  // but the new articles should just change opacity gradually;
                  // the animation should not be 2-way
                  // sometimes the most visible article gets stuck in the wrong position
                  return Consumer<CategoryIndexNotifier>(
                      builder: (context, categoryIndexNotifier, child) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: Stack(
                        key: ValueKey(categoryIndexNotifier.categoryIndex),
                        clipBehavior: Clip.none,
                        children: List.generate(posts.length, (index) {
                          return AnimatedPositioned(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            top: index * 65,
                            left: 0,
                            right: 0,
                            child: Dismissible(
                              key: ValueKey(posts[index].id),
                              direction: DismissDirection.vertical,
                              onDismissed: (direction) {
                                final post = posts[index];

                                setState(() {
                                  notifier.postsFiltered.removeAt(index);
                                });

                                Future.delayed(const Duration(milliseconds: 400), () {
                                  setState(() {
                                    posts.add(post);
                                  });
                                });
                              },
                              child: AnimatedScale(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                                scale: 1 - (index * 0.2),
                                child: PostCard(
                                  post: posts[index],
                                  onTap: openArticlePage,
                                ),
                              ),
                            ),
                          );
                        }).reversed.toList(),
                      ),
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
