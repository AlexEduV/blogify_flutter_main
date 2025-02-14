import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/circled_button_outlined.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/circled_button.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/post_card.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //todo: move to domain / data layer
  List<PostEntity> posts = [
    PostEntity(
      id: 1,
      title: 'Where Web 3\nis Going to?',
      author: 'Josh Brian',
      daysAgoPublished: 1,
      minToRead: 5,
    ),
    PostEntity(
      id: 2,
      title: 'Good Listeners Urgently Required',
      author: 'Jay Fitzgerald',
      daysAgoPublished: 2,
      minToRead: 15,
    ),
    PostEntity(
      id: 3,
      title: 'Being a Better Creative Director',
      author: 'Britton Stipetic',
      daysAgoPublished: 6,
      minToRead: 10,
    ),
  ];


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
                    icon: Icons.person,
                    onTap: () {},
                  ),

                ],
              ),

              SizedBox(height: 24.0),

              //search bar
              SearchBar(
                padding: WidgetStatePropertyAll(EdgeInsets.only(left: 16.0, right: 8.0),),
                leading: Icon(
                  Icons.search,
                  color: AppColors.accentColor,
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
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: List.generate(posts.length, (index) {

                    return AnimatedPositioned(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      top: index * 25,
                      left: 0,
                      right: 0,
                      child: Dismissible(
                        key: ValueKey(posts[index].id),
                        direction: DismissDirection.vertical,
                        onDismissed: (direction) {
                          //todo: when the stack shakes all cards,
                          // there's something off.
                          final PostEntity post = posts[index];

                          setState(() {
                            posts.removeAt(index);
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
                          scale: 1 - (index * 0.05),
                          child: PostCard(
                            title: posts[index].title,
                            author: posts[index].author,
                            publishedWhen: '${posts[index].daysAgoPublished} ${posts[index].daysAgoPublished == 1 ? "day" : "days"} ago',
                            readTimeEstimated: '${posts[index].minToRead} min',
                          ),
                        ),
                      ),
                    );
                  }).reversed.toList(),
                ),
              ),

              SizedBox(height: 24.0,),

              // topic selector & edit button
              Row(
                spacing: 12,
                children: [

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          //topic selector
                          RoundedButton(text: 'Trending', isSelected: true,),

                          RoundedButton(text: 'Design'),

                          RoundedButton(text: 'Tech'),

                        ],
                      ),
                    ),
                  ),

                  CircledButton(icon: Icons.edit, onTap: () {}),
                ],
              ),

              SizedBox(height: 16.0,),

            ],
          ),
        ),
      ),
    );
  }
}
