import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/user_settings_page/widgets/list_item.dart';
import 'package:blogify_flutter_main/presentation/pages/user_settings_page/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../widgets/user_photo.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //todo: move to a repository or data source with toJson and fromJson methods
    final activityItems = [
      {'icon': FontAwesomeIcons.fileLines, 'title': L10n.settingsPublishedArticlesItemTitle},
      {'icon': FontAwesomeIcons.thumbsUp, 'title': L10n.settingsLikedArticlesItemTitle},
    ];

    final generalItems = [
      {'icon': FontAwesomeIcons.user, 'title': L10n.settingsPersonalDataItemTitle},
      {'icon': FontAwesomeIcons.bell, 'title': L10n.settingsPushNotificationsItemTitle},
      {'icon': FontAwesomeIcons.gear, 'title': L10n.settingsGeneralSettingsItemTitle},
    ];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.majorS),
        child: SingleChildScrollView(
          child: Consumer<UserDataNotifier>(builder: (context, userNotifier, child) {
            return Column(
              children: [
                const Text(
                  L10n.appSettingsTitle,
                  style: AppTextStyles.sfPro16,
                ),

                const SizedBox(height: AppDimensions.normalM),

                //todo: enable replacement (tier + 1)
                UserPhoto(
                  imageSrc: userNotifier.user.imageSrc,
                ),

                const SizedBox(height: AppDimensions.normalM),

                Text(
                  '${userNotifier.user.firstName} ${userNotifier.user.lastName}',
                  style: AppTextStyles.sfPro20,
                ),

                const SizedBox(height: AppDimensions.minorS),

                Text(
                  userNotifier.user.email,
                  style: AppTextStyles.sfPro12Dark,
                ),

                const SizedBox(height: AppDimensions.majorL),

                buildSection(L10n.settingsSectionYourActivity, activityItems),
                buildSection(L10n.settingsSectionGeneral, generalItems),

                //app version footer
                Text(
                  '${L10n.appName}, ${L10n.appVersion}',
                  style: AppTextStyles.sfPro12Dark,
                ),

                const SizedBox(height: AppDimensions.majorM),
              ],
            );
          }),
        ),
      ),
    );
  }

  // Helper method to build sections
  Widget buildSection(String title, List<Map<String, dynamic>> items) {
    return Column(
      children: [
        const SizedBox(height: AppDimensions.majorL),

        SectionTitle(title: title),

        const SizedBox(height: AppDimensions.normalM),

        //todo: can be refactored to 'spacing: '
        ...items.map((item) {
          return Column(
            children: [
              ListItem(
                //todo: onTap has to lead somewhere
                onTap: () {},
                icon: item['icon'],
                title: item['title'],
              ),
              const SizedBox(height: AppDimensions.normalM),
            ],
          );
        }),
      ],
    );
  }
}
