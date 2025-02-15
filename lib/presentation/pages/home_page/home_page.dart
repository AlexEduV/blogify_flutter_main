import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/domain/helpers/category_helper.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/circled_button_outlined.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/notifiers/category_index_notifier.dart';
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

  //todo: search selector
  //todo: change app font to Inter of San Francisco
  //todo: dig into animations to create what you want

  @override
  void initState() {
    super.initState();

    final storageNotifier = context.read<GlobalMockStorageProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      storageNotifier.initStorage();
      storageNotifier.loadAllInCategory(Category.trending);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    onTap: () => onUserSettingsButtonPressed(),
                  ),

                ],
              ),

              const SizedBox(height: 24.0),

              //search bar
              //todo: if I search for something, and then open another page, the keyboard,
              // which was on, returns, when I come back, but after navigating back and forth
              // it seems not normal
              SearchBar(
                padding: const WidgetStatePropertyAll(EdgeInsets.only(left: 16.0, right: 8.0),),
                leading: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: AppColors.accentColor,
                  size: 20,
                ),
                trailing: [
                  RoundedButton(
                    text: 'Author',
                    trailingIcon: Icons.keyboard_arrow_down_outlined,
                    isSelected: true,
                    //todo: show filter selector with Author, title filter
                    onTap: () {},
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
                onChanged: (String filter) {
                  final storageNotifier = context.read<GlobalMockStorageProvider>();
                  storageNotifier.filter(filter);
                },
              ),

              const SizedBox(height: 24.0),

              //card stack
              Expanded(
                child: Consumer<GlobalMockStorageProvider>(
                  builder: (context, notifier, child) {

                    final posts = notifier.postsFiltered;

                    return SizedBox(
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: List.generate(posts.length, (index) {

                          return AnimatedPositioned(
                            key: ValueKey(posts[index].id),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            top: index * 65,
                            left: 0,
                            right: 0,
                            child: Dismissible(
                              key: ValueKey(posts[index].id),
                              direction: DismissDirection.vertical,
                              onDismissed: (direction) {

                                final PostEntity post = posts[index];

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
                  }
                ),
              ),

              const SizedBox(height: 24.0,),

              // topic selector & edit button
              Consumer<CategoryIndexNotifier>(
                builder: (context, notifier, child) {

                  return Row(
                    spacing: 12,
                    children: [

                      Expanded(
                        child: CategorySelector(
                          selectedIndex: notifier.categoryIndex,
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
                  );
                }
              ),

              const SizedBox(height: 16.0,),

            ],
          ),
        ),
      ),
    );
  }

  void onUserSettingsButtonPressed() {

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
    //update index
    context.read<CategoryIndexNotifier>().update(index);

    //filter storage
    final category = CategoryHelper.getCategoryByIndex(index);

    final storageNotifier = context.read<GlobalMockStorageProvider>();
    storageNotifier.loadAllInCategory(category);

  }

  void openArticlePage(int id) {
    context.router.push(ArticleRoute(id: id,));
  }
}
