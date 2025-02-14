import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/core/utils/day_plural_formatter.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/circled_button_outlined.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/category_selector.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/circled_button.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/post_card.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:blogify_flutter_main/presentation/pages/user_settings_page/user_settings_page.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:blogify_flutter_main/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int categoryIndex = 0;

  bool isInsertAnimationStarted = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GlobalMockStorageProvider>().load();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              const SizedBox(height: 24.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Row(
                        children: [

                          Text(
                            'Hello, ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24.0,
                              height: 1.4,
                            ),
                          ),

                          Text(
                            'Jason',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24.0,
                              height: 1.4,
                            ),
                          )
                        ],
                      ),

                      Text(
                        'I have some news for you',
                        style: TextStyle(
                          color: AppColors.accentColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),

                  //Settings button
                  CircledButtonOutlined(
                    icon: FontAwesomeIcons.user,
                    onTap: () => onUserButtonPressed(),
                  ),

                ],
              ),

              const SizedBox(height: 24.0),

              //search bar
              SearchBar(
                padding: const WidgetStatePropertyAll(EdgeInsets.only(left: 16.0, right: 8.0),),
                leading: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: AppColors.accentColor,
                  size: 20,
                ),
                trailing: const [
                  RoundedButton(
                    text: 'Author',
                    trailingIcon: Icons.keyboard_arrow_down_outlined,
                    isSelected: true,
                  ),
                ],
                hintText: 'Search here',
                hintStyle: WidgetStatePropertyAll(
                    TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 14.0,
                  ),
                ),
                elevation: const WidgetStatePropertyAll(0.0),
                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[200]!, width: 1),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),

              const SizedBox(height: 24.0),

              //card stack
              Expanded(
                child: Consumer<GlobalMockStorageProvider>(
                  builder: (context, notifier, child) {

                    final posts = notifier.posts;

                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: List.generate(posts.length, (index) {

                        return AnimatedPositioned(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          top: isInsertAnimationStarted ? 0 : index * 60,
                          left: 0,
                          right: 0,
                          child: Dismissible(
                            key: ValueKey(posts[index].id),
                            direction: DismissDirection.vertical,
                            onDismissed: (direction) {
                              final PostEntity post = posts[index];

                              setState(() {
                                notifier.posts.removeAt(index);
                                isInsertAnimationStarted = true;
                              });

                              Future.delayed(const Duration(milliseconds: 400), () {
                                setState(() {

                                  //todo: somehow, if the index is last, we should animate it,
                                  // - leave all other items as they are;

                                  //if the insertion index == length (one before last),
                                  // the animation is good, but we're cycling only 2 items, not all

                                  //insertion is not really good in this case, since the calculations are based
                                  //on index

                                  // the current workaround makes stack folded and than spread out again
                                  // it's production-ready, but not what I intended. I wanted a queue effect.
                                  // the item gets deleted. The others slide to the user (get bigger), then
                                  // the tip of the last item is seen after 400 ms when it's inserted.

                                  // maybe if I store the position somewhere, so that I can more easily track
                                  // and customise it, not resetting in on state change.

                                  posts.add(post);
                                  isInsertAnimationStarted = false;
                                });
                              });
                            },
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                              scale: 1 - (index * 0.2),
                              child: InkWell(
                                onTap: () => openArticlePage(posts[index].id),
                                child: PostCard(
                                  title: posts[index].title,
                                  author: posts[index].author,
                                  publishedWhen: '${posts[index].daysAgoPublished} ${DayEndingFormatter.getFormattedDays(posts[index].daysAgoPublished)} ago',
                                  readTimeEstimated: '${posts[index].minToRead} min',
                                ),
                              ),
                            ),
                          ),
                        );
                      }).reversed.toList(),
                    );
                  }
                ),
              ),

              const SizedBox(height: 24.0,),

              // topic selector & edit button
              Row(
                spacing: 12,
                children: [

                  Expanded(
                    child: CategorySelector(
                      selectedIndex: categoryIndex,
                      items: const [
                        'Trending',
                        'Design',
                        'Tech',
                      ],
                      onItemTapped: onCategoryItemTapped,
                    ),
                  ),

                  //todo: new publication screen
                  CircledButton(icon: FontAwesomeIcons.pen, onTap: () {}),
                ],
              ),

              const SizedBox(height: 16.0,),

            ],
          ),
        ),
      ),
    );
  }

  void onUserButtonPressed() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (BuildContext context) {

          return const UserSettingsPage();
        }
    );
  }

  void onCategoryItemTapped(int index) {
    setState(() {
      categoryIndex = index;
    });
  }

  void openArticlePage(int id) {
    context.router.push(ArticleRoute(id: id,));
  }
}
