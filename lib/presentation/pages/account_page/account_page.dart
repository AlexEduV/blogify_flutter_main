import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/account_page/widgets/account_section.dart';
import 'package:blogify_flutter_main/presentation/pages/account_page/widgets/app_version_footer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../router/app_router.gr.dart';
import '../../notifiers/account_page/account_page_notifier.dart';
import '../../widgets/user_photo.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    //todo: move to a repository or data source with toJson and fromJson methods
    final activityItems = [
      {
        'icon': FontAwesomeIcons.fileLines,
        'title': L10n.accountItemPublishedArticlesTitle,
        'onTap': () => context.router.push(const PublishedArticlesRoute()),
      },
      {
        'icon': Icons.favorite_outline_rounded,
        'title': L10n.accountItemLikedArticlesTitle,
        'onTap': () => context.router.push(const LikedArticlesRoute()),
      },
    ];

    final generalItems = [
      {'icon': FontAwesomeIcons.user, 'title': L10n.accountItemPersonalDataTitle, 'onTap': null},
      {'icon': FontAwesomeIcons.bell, 'title': L10n.accountPushNotificationsTitle, 'onTap': null},
      {'icon': FontAwesomeIcons.gear, 'title': L10n.accountItemGeneralSettingsTitle, 'onTap': null},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.majorL,
          ).copyWith(top: AppDimensions.majorS, bottom: AppDimensions.normalM),
          child: Consumer<UserDataNotifier>(
            builder: (context, userNotifier, child) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          UserPhoto(
                            size: AppDimensions.accountUserAvatarSize,
                            imageSrc: userNotifier.user.imageSrc,
                            onSecondaryTap: () => onUserPhotoPressed(context),
                          ),

                          const SizedBox(height: AppDimensions.minorS),

                          Text(
                            '${userNotifier.user.firstName} ${userNotifier.user.lastName}',
                            style: AppTextStyles.sfPro20,
                          ),

                          const SizedBox(height: AppDimensions.minorS),

                          Text(userNotifier.user.email, style: AppTextStyles.sfPro16Accent),

                          const SizedBox(height: AppDimensions.minorS),

                          AccountSection(
                            title: L10n.accountSectionYourActivity,
                            items: activityItems,
                          ),

                          AccountSection(title: L10n.accountSectionGeneral, items: generalItems),
                        ],
                      ),
                    ),
                  ),

                  const AppVersionFooter(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> onUserPhotoPressed(BuildContext context) async {
    final path = await context.read<AccountPageNotifier>().getNewUserImageSrc();

    if (!context.mounted) return;

    final userNotifier = context.read<UserDataNotifier>();
    userNotifier.updateUser(userNotifier.user.copyWith(imageSrc: path));
  }
}
