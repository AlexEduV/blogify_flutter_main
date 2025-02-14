import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/core/utils/day_plural_formatter.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/circled_button_outlined.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/photo_place_holder.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
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
        child: Stack(
          children: [

            SingleChildScrollView(
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

                                const Text(
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
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24.0,
                          ),
                        ),

                        const SizedBox(height: 24,),

                        //post info row
                        Text(
                          '${post.author}  | ${post.daysAgoPublished} ${DayEndingFormatter.getFormattedDays(post.daysAgoPublished)} ago,  |  Read time: ${post.minToRead} min',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.0,
                            color: Colors.black54,
                          ),
                        ),

                        const SizedBox(height: 24,),

                        //photo cover
                        PhotoPlaceHolder(
                          placeholderColor: Colors.grey[300]!,
                          height: 220,
                        ),

                        const SizedBox(height: 24,),

                        //post content
                        Text(
                          post.content,
                          style: const TextStyle(
                            fontSize: 13.0,
                            height: 1.7,
                          ),
                        ),

                      ],
                    );
                  }
                ),
              ),
            ),

            //todo: maybe hide the button, when the user is reading (changes the scroll position)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.7, sigmaY: 0.7), // Blur entire row
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.black, // Keep original button color
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4), // Shadow for button
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const RoundedButton(
                            text: 'Share',
                            isSelected: true,
                            horizontalPadding: 32.0,
                            leadingIcon: FontAwesomeIcons.arrowUpFromBracket,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
