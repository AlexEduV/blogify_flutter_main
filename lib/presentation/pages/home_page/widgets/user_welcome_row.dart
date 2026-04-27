import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/app_colors.dart';
import '../../../../data/mock_storage/global_mock_user_provider.dart';
import '../../../widgets/user_photo.dart';
import '../../user_settings_page/user_settings_page.dart';

class UserWelcomeRow extends StatelessWidget {
  const UserWelcomeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //todo: replace with text span
            Row(
              children: [
                const Text(
                  L10n.welcomeScreenLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    height: 1.4,
                  ),
                ),
                Consumer<GlobalMockUserProvider>(builder: (context, notifier, child) {
                  return Text(
                    notifier.currentUser.firstName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                      height: 1.4,
                    ),
                  );
                })
              ],
            ),
            const Text(
              L10n.welcomeScreenSubtitle,
              style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 14.0,
              ),
            ),
          ],
        ),

        //User Settings button
        //todo: no material effect is visible
        Material(
          child: InkWell(
            borderRadius: BorderRadius.circular(50.0),
            onTap: () => onUserSettingsButtonPressed(context),
            child: Consumer<GlobalMockUserProvider>(builder: (context, notifier, child) {
              return UserPhoto(
                imageSrc: notifier.currentUser.imageSrc,
                size: AppDimensions.appBarUserAvatarImageSize,
              );
            }),
          ),
        ),
      ],
    );
  }

  void onUserSettingsButtonPressed(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const UserSettingsPage();
        });
  }
}
