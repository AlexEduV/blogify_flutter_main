import 'package:blogify_flutter_main/core/utils/app_display_version.dart';
import 'package:blogify_flutter_main/presentation/pages/user_settings_page/widgets/list_item.dart';
import 'package:blogify_flutter_main/presentation/pages/user_settings_page/widgets/section_title.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          child: Column(
            children: [

              const Text(
                'Settings',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),

              const SizedBox(height: 16.0,),

              //user photo
              //todo: replace with actual photo / or enable replacement (tier + 1)
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              ),

              const SizedBox(height: 16.0,),

              const Text(
                'Jason Todd',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 4.0,),

              const Text(
                'therealjason@gmail.com',
                style: TextStyle(
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
