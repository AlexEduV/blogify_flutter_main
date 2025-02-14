import 'package:blogify_flutter_main/presentation/pages/user_page/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListItem extends StatelessWidget {

  final IconData icon;
  final String title;

  const ListItem({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        spacing: 8.0,
        children: [

          FaIcon(
            icon,
            size: 20,
            color: Colors.black87,
          ),

          SectionTitle(title: title),

        ],
      ),
    );
  }
}
