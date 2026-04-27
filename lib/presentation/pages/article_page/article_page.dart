import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../utils/intl_formatter.dart';
import '../../widgets/circled_button_outlined.dart';
import '../../widgets/post_cover_photo.dart';

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
                padding: const EdgeInsets.all(AppDimensions.majorS),
                child: Consumer<GlobalMockStorageProvider>(builder: (context, notifier, child) {
                  final post = notifier.allPosts.firstWhere((post) => post.id == widget.id);

                  return Column(
                    spacing: AppDimensions.majorS,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: AppDimensions.normalM,
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
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: AppDimensions.normalM,
                            children: [
                              CircledButtonOutlined(
                                icon: FontAwesomeIcons.comment,
                                onTap: () => context.router.push(CommentsRoute(id: widget.id)),
                              ),
                              CircledButtonOutlined(
                                icon: post.isLiked
                                    ? FontAwesomeIcons.solidThumbsUp
                                    : FontAwesomeIcons.thumbsUp,
                                onTap: () => notifier.likePost(widget.id),
                              ),
                              CircledButtonOutlined(
                                icon: FontAwesomeIcons.share,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),

                      Text(
                        post.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                        ),
                      ),

                      //post info row
                      Text(
                        '${post.author}  |  ${IntlFormatter.getFormattedDays(post.daysAgoPublished)}  |  Read time: ${post.minToRead} min',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0,
                          color: Colors.black54,
                        ),
                      ),

                      //photo cover
                      PostCoverPhoto(
                        imageSrc: post.imageSrc,
                        placeholderColor: Colors.grey[300]!,
                        height: 220,
                      ),

                      //post content
                      ListView.separated(
                        itemBuilder: (context, index) {
                          return Text(
                            post.paragraphs[index],
                            style: const TextStyle(
                              fontSize: 14.0,
                              height: 1.7,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: AppDimensions.normalS);
                        },
                        itemCount: post.paragraphs.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
