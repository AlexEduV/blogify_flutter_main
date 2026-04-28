import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/common/app_constants.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/presentation/notifiers/home_page/category_index_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/empty_posts_placeholder.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/home_bottom_bar.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/home_search_bar.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/post_card.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/user_welcome_row.dart';
import 'package:blogify_flutter_main/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/global_mock_storage_provider.dart';

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

  final CardSwiperController controller = CardSwiperController();
  final searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => searchFocusNode.unfocus(),
        behavior: HitTestBehavior.translucent,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.all(AppDimensions.majorS).copyWith(bottom: AppDimensions.normalM),
            child: Column(
              spacing: AppDimensions.majorS,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const UserWelcomeRow(),

                //search bar
                HomeSearchBar(
                  searchMenuKey: _searchSelectorButtonKey,
                  focusNode: searchFocusNode,
                ),

                //card stack
                Expanded(
                  child: Consumer<GlobalMockStorageProvider>(builder: (context, notifier, child) {
                    final posts = notifier.postsFiltered;
                    if (posts.isEmpty) {
                      return const EmptyPostsPlaceholder();
                    }

                    //post stack
                    return Consumer<CategoryIndexNotifier>(
                        builder: (_, categoryIndexNotifier, child) {
                      return CardSwiper(
                        controller: controller,
                        cardsCount: posts.length,
                        onSwipe: (_, __, direction) => true,
                        numberOfCardsDisplayed: limitedCount(posts.length),
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
      ),
    );
  }

  void openArticlePage(int id) {
    context.router.push(ArticleRoute(id: id));
  }

  int limitedCount(int length, [int max = AppConstants.homePagePostsVisibleCount]) =>
      min(length, max);
}
