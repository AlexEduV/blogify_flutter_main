import 'package:blogify_flutter_main/core/utils/app_display_version.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_user_provider.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/user_photo.dart';
import 'package:blogify_flutter_main/presentation/pages/user_settings_page/widgets/list_item.dart';
import 'package:blogify_flutter_main/presentation/pages/user_settings_page/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final activityItems = [
      {'icon': FontAwesomeIcons.fileLines, 'title': 'Published Articles'},
      {'icon': FontAwesomeIcons.thumbsUp, 'title': 'Liked Articles'},
    ];

    final generalItems = [
      {'icon': FontAwesomeIcons.user, 'title': 'Personal Data'},
      {'icon': FontAwesomeIcons.bell, 'title': 'Push Notifications'},
      {'icon': FontAwesomeIcons.gear, 'title': 'Settings'},
    ];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Consumer<GlobalMockUserProvider>(
            builder: (context, userNotifier, child) {

              return Column(
                children: [

                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),

                  const SizedBox(height: 16.0,),

                  //todo: replace with actual photo / or enable replacement (tier + 1)
                  UserPhoto(
                    imageSrc: userNotifier.currentUser.imageSrc,
                  ),
              
                  const SizedBox(height: 16.0,),

                  Text(
                    '${userNotifier.currentUser.firstName} ${userNotifier.currentUser.lastName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 4.0,),

                  Text(
                    userNotifier.currentUser.email,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
                    ),
                  ),

                  const SizedBox(height: 32.0,),

                  buildSection('Your Activity', activityItems),
                  buildSection('General', generalItems),

                  //app version footer
                  Text('Blogify, ${AppDisplayVersion.appVersion}',
                    style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                  ),

                  ),

                  const SizedBox(height: 16.0,),

                ],
              );
            }
          ),
        ),
      ),
    );
  }

  // Helper method to build sections
  Widget buildSection(String title, List<Map<String, dynamic>> items) {
    return Column(
      children: [
        const SizedBox(height: 32.0),
        SectionTitle(title: title),
        const SizedBox(height: 16.0),
        ...items.map((item) {
          return Column(
            children: [
              ListItem(
                //todo: onTap has to lead somewhere
                onTap: () {},
                icon: item['icon'],
                title: item['title'],
              ),
              const SizedBox(height: 16.0),
            ],
          );
        }),
      ],
    );
  }
}
