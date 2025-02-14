import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/circled_button_outlined.dart';
import 'package:blogify_flutter_main/presentation/pages/article_page/article_page.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/category_selector.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/circled_button.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/post_card.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
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

  @override
  void initState() {
    super.initState();

    context.read<GlobalMockStorageProvider>().load();
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

                      Row(
                        children: [

                          const Text(
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
                    onTap: () {},
                  ),

                ],
              ),

              SizedBox(height: 24.0),

              //search bar
              SearchBar(
                padding: WidgetStatePropertyAll(EdgeInsets.only(left: 16.0, right: 8.0),),
                leading: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: AppColors.accentColor,
                  size: 20,
                ),
                trailing: [
                  RoundedButton(
                    text: 'Author',
                    icon: Icons.keyboard_arrow_down_outlined,
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
                elevation: WidgetStatePropertyAll(0.0),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[200]!, width: 1),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),

              SizedBox(height: 24.0),

              //card stack
              Expanded(
                child: Consumer<GlobalMockStorageProvider>(
                  builder: (context, notifier, child) {

                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: List.generate(notifier.posts.length, (index) {

                        return AnimatedPositioned(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          top: index * 60,
                          left: 0,
                          right: 0,
                          child: Dismissible(
                            key: ValueKey(notifier.posts[index].id),
                            direction: DismissDirection.vertical,
                            onDismissed: (direction) {
                              //todo: when the stack shakes all cards,
                              // there's something off.
                              final PostEntity post = notifier.posts[index];

                              setState(() {
                                notifier.posts.removeAt(index);
                              });

                              Future.delayed(const Duration(milliseconds: 400), () {
                                setState(() {
                                  notifier.posts.add(post);
                                });
                              });
                            },
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                              scale: 1 - (index * 0.2),
                              child: InkWell(
                                onTap: () {
                                  openArticlePage(notifier.posts[index].id);
                                },
                                child: PostCard(
                                  title: notifier.posts[index].title,
                                  author: notifier.posts[index].author,
                                  publishedWhen: '${notifier.posts[index].daysAgoPublished} ${notifier.posts[index].daysAgoPublished == 1 ? "day" : "days"} ago',
                                  readTimeEstimated: '${notifier.posts[index].minToRead} min',
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

              SizedBox(height: 24.0,),

              // topic selector & edit button
              Row(
                spacing: 12,
                children: [

                  Expanded(
                    child: CategorySelector(
                      selectedIndex: categoryIndex,
                      items: [
                        'Trending',
                        'Design',
                        'Tech',
                      ],
                      onItemTapped: onCategoryItemTapped,
                    ),
                  ),

                  //todo: new publication screen
                  CircledButton(icon: FontAwesomeIcons.penToSquare, onTap: () {}),
                ],
              ),

              SizedBox(height: 16.0,),

            ],
          ),
        ),
      ),
    );
  }

  void onCategoryItemTapped(int index) {
    setState(() {
      categoryIndex = index;
    });
  }

  void openArticlePage(int id) {
    context.router.push(ArticleRoute(index: id,));
  }
}
