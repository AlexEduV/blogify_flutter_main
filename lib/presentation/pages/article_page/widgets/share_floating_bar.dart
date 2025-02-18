import 'dart:ui';

import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShareFloatingBar extends StatelessWidget {
  const ShareFloatingBar({super.key});

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
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
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4), // Shadow for button
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: RoundedButton(
                  text: 'Share',
                  filled: true,
                  horizontalPadding: 32.0,
                  leadingIcon: FontAwesomeIcons.arrowUpFromBracket,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
