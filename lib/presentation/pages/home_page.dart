import 'package:blogify_flutter_main/presentation/common/widgets/circled_button.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/search_bar_selector.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 8.0, color: Colors.white,),
                ),
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: 270,
                      padding: EdgeInsets.all(8.0),
                    ),

                    SizedBox(height: 16.0,),

                    Text(
                      'Josh Brian',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),

                    SizedBox(height: 4.0),

                    Text(
                      '2 days ago',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                        color: AppColors.accentColor,
                      ),
                    ),

                    SizedBox(height: 28.0,),

                    Text(
                      'Where Web 3\nis Going to?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28.0,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 28.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Read Time: ',
                          style: TextStyle(
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Text(
                          '5 min',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.0,),

                  ],
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
