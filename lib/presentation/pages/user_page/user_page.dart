import 'package:blogify_flutter_main/presentation/pages/user_page/widgets/section_title.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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

            const SectionTitle(title: 'Your Activity'),

            const SizedBox(height: 16.0,),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                spacing: 8.0,
                children: [

                  FaIcon(
                    FontAwesomeIcons.fileLines,
                    size: 24,
                    color: Colors.black87,
                  ),

                  SectionTitle(title: 'Published Articles'),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
