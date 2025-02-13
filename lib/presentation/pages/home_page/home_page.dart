import 'package:blogify_flutter_main/presentation/common/widgets/circled_button.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/post_card.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/search_bar_selector.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //todo: change to entities
  List<PostCard> cardWidgets = [
    PostCard(
      title: 'Where Web 3\nis Going to?',
      author: 'Josh Brian',
      publishedWhen: '1 days ago',
      readTimeEstimated: '5 min',
    ),
    PostCard(
      title: 'Where Web 3\nis Going to?',
      author: 'Josh Brian',
      publishedWhen: '2 days ago',
      readTimeEstimated: '5 min',
    ),
    PostCard(
      title: 'Where Web 3\nis Going to?',
      author: 'Josh Brian',
      publishedWhen: '3 days ago',
      readTimeEstimated: '5 min',
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
                  CircledButton(
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
                  SearchBarSelector(),
                ],
                hintText: 'Search here',
                hintStyle: WidgetStatePropertyAll(TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 14.0,
                )),
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
                  alignment: Alignment.center,
                  children: List.generate(cardWidgets.length, (index) {

                    return Positioned(
                      top: index * 25,
                      left: 0,
                      right: 0,
                      child: Dismissible(
                        key: Key(cardWidgets[index].hashCode.toString()),
                        direction: DismissDirection.vertical,
                        onDismissed: (direction) {
                          setState(() {
                            //todo: maybe not the best solution
                            cardWidgets.removeAt(index);
                          });
                        },
                        child: Transform.scale(
                          scale: 1 - (index * 0.05),
                          child: cardWidgets[index],
                        ),
                      ),
                    );
                  }).reversed.toList(),
                ),
              ),

              // topic selector & edit button

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
