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
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),

                  //Person button
                  Icon(Icons.person),


                ],
              ),
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
