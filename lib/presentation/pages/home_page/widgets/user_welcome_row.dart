import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                Text(
                  L10n.welcomeScreenLabel,
                  style: AppTextStyles.sfPro24.copyWith(fontWeight: FontWeight.w500),
                ),
                Consumer<UserDataNotifier>(builder: (context, notifier, child) {
                  return Text(
                    notifier.user.firstName,
                    style: AppTextStyles.sfPro24,
                  );
                })
              ],
            ),
            Text(
              L10n.welcomeScreenSubtitle,
              style: AppTextStyles.sfPro14Accent,
            ),
          ],
        ),

        //User Settings button
        //todo: no material effect is visible
        Material(
          child: InkWell(
            borderRadius: BorderRadius.circular(50.0),
            onTap: () => onUserSettingsButtonPressed(context),
            child: Consumer<UserDataNotifier>(builder: (context, notifier, child) {
              return UserPhoto(
                imageSrc: notifier.user.imageSrc,
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
