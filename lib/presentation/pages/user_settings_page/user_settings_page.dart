import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_user_provider.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
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
          child: Consumer<GlobalMockUserProvider>(builder: (context, userNotifier, child) {
            return Column(
              children: [
                const Text(
                  L10n.appSettingsTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),

                const SizedBox(height: AppDimensions.normalM),

                //todo: enable replacement (tier + 1)
                UserPhoto(
                  imageSrc: userNotifier.currentUser.imageSrc,
                ),

                const SizedBox(height: AppDimensions.normalM),

                Text(
                  '${userNotifier.currentUser.firstName} ${userNotifier.currentUser.lastName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: AppDimensions.minorS),

                Text(
                  userNotifier.currentUser.email,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                  ),
                ),

                const SizedBox(height: AppDimensions.majorL),

                buildSection(L10n.settingsSectionYourActivity, activityItems),
                buildSection(L10n.settingsSectionGeneral, generalItems),

                //app version footer
                const Text(
                  '${L10n.appName}, ${L10n.appVersion}',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                  ),
                ),

                const SizedBox(height: AppDimensions.normalM),
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
