import 'dart:math';

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
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
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

  final CardSwiperController controller = CardSwiperController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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

                  final visibleCount = 3;

                  //post stack
                  return Consumer<CategoryIndexNotifier>(
                      builder: (_, categoryIndexNotifier, child) {
                    return CardSwiper(
                      controller: controller,
                      cardsCount: posts.length,
                      onSwipe: (_, __, direction) => true,
                      numberOfCardsDisplayed: limitedCount(visibleCount),
                      backCardOffset: const Offset(0, 40),
                      padding: EdgeInsets.zero,
                      cardBuilder: (
                        context,
                        index,
                        horizontalThresholdPercentage,
                        verticalThresholdPercentage,
                      ) =>
                          PostCard(post: posts[index], onTap: openArticlePage),
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

  int limitedCount(int length, [int max = 3]) => min(length, max);
}
