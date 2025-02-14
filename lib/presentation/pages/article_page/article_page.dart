import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/circled_button_outlined.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/photo_place_holder.dart';
import 'package:blogify_flutter_main/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ArticlePage extends StatefulWidget {

  final int id;

  const ArticlePage({
    required this.id,
    super.key,
  });

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Consumer<GlobalMockStorageProvider>(
            builder: (context, notifier, child) {

              final post = notifier.posts.where((post) => post.id == widget.id).first;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 24.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        spacing: 16.0,
                        children: [

                          CircledButtonOutlined(
                            icon: FontAwesomeIcons.chevronLeft,
                            onTap: () {
                              context.router.popUntilRouteWithName(HomeRoute.name);
                            },
                          ),

                          Text(
                            'Back',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                            ),
                          ),

                        ],
                      ),

                      Row(
                        spacing: 16.0,
                        children: [

                          CircledButtonOutlined(
                            icon: FontAwesomeIcons.comment,
                            onTap: () {},
                          ),

                          CircledButtonOutlined(
                            icon: post.isLiked
                                ? FontAwesomeIcons.solidThumbsUp : FontAwesomeIcons.thumbsUp,
                            onTap: () {
                              notifier.likePost(widget.id);
                            },
                          ),

                        ],
                      ),

                    ],
                  ),

                  const SizedBox(height: 24,),

                  Text(
                    post.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                    ),
                  ),

                  const SizedBox(height: 24,),

                  //post info row
                  Text(
                    //todo: day / days differentiation
                    '${post.author}  |  ${post.daysAgoPublished} days ago  |  Read time: ${post.minToRead} min',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 24,),

                  //photo cover
                  PhotoPlaceHolder(
                    placeholderColor: Colors.grey[300]!,
                  ),

                  const SizedBox(height: 24,),

                  //post content


                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
