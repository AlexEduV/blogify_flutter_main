import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/common/enums/post_filter.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/home_page/search_bar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:provider/provider.dart';

import '../../../../utils/intl_day_formatter.dart';
import '../../../widgets/post_cover_photo.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  final Function(int) onTap;

  const PostCard({required this.post, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: InkWell(
        onTap: () => onTap(post.id),
        borderRadius: BorderRadius.circular(AppDimensions.normalL),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppDimensions.normalL),
            border: Border.all(width: AppDimensions.minorS, color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.17),
                blurRadius: 30,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(AppDimensions.minorS),
          child: Column(
            children: [
              PostCoverPhoto(imageSrc: post.imageSrc),

              const SizedBox(height: AppDimensions.normalM),

              Consumer<SearchBarNotifier>(
                builder: (context, notifier, child) {
                  const baselineOffset = 1.0;

                  final Map<String, HighlightedWord> wordsToHighlight =
                      notifier.selectedFilterType == PostFilter.author
                      ? {
                          notifier.searchControllerValue: HighlightedWord(
                            padding: const EdgeInsets.only(bottom: baselineOffset),
                            textStyle: AppTextStyles.sfPro16.copyWith(
                              backgroundColor: Colors.amber,
                            ),
                          ),
                        }
                      : {};

                  final textContainsHighlight =
                      notifier.searchControllerValue.isNotEmpty &&
                      notifier.selectedFilterType == PostFilter.author;

                  return Padding(
                    padding: EdgeInsets.only(bottom: textContainsHighlight ? 0 : baselineOffset),
                    child: TextHighlight(
                      text: post.author,
                      textStyle: AppTextStyles.sfPro16,
                      words: wordsToHighlight,
                    ),
                  );
                },
              ),

              Text(
                IntlDayFormatter.getFormattedDays(post.daysAgoPublished),
                style: AppTextStyles.sfPro14Accent,
              ),

              const SizedBox(height: AppDimensions.majorS),

              Consumer<SearchBarNotifier>(
                builder: (context, notifier, child) {
                  const baselineOffset = 6.0;

                  final Map<String, HighlightedWord> wordsToHighlight =
                      notifier.selectedFilterType == PostFilter.title
                      ? {
                          notifier.searchControllerValue: HighlightedWord(
                            padding: const EdgeInsets.only(bottom: baselineOffset),
                            textStyle: AppTextStyles.sfPro24.copyWith(
                              backgroundColor: Colors.amber,
                            ),
                          ),
                        }
                      : {};

                  return TextHighlight(
                    words: wordsToHighlight,
                    text: '${post.title} \n',
                    textStyle: AppTextStyles.sfPro24,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  );
                },
              ),

              const SizedBox(height: AppDimensions.majorS),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${L10n.articleReadTimeLabel} ',
                    style: AppTextStyles.sfPro14Accent.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${post.minToRead} ${L10n.articleReadTimeUnits}',
                    style: AppTextStyles.sfPro14.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              const SizedBox(height: AppDimensions.normalS),
            ],
          ),
        ),
      ),
    );
  }
}
