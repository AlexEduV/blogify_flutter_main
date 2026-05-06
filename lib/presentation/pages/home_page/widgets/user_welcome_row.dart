import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../router/app_router.gr.dart';
import '../../../widgets/user_photo.dart';

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
            Row(
              children: [
                Text(
                  L10n.welcomeScreenLabel,
                  style: AppTextStyles.sfPro24.copyWith(fontWeight: FontWeight.w500),
                ),
                Selector<UserDataNotifier, String>(
                  selector: (context, model) => model.user.firstName,
                  builder: (context, firstName, child) {
                    return Text(firstName, style: AppTextStyles.sfPro24);
                  },
                ),
              ],
            ),
            Text(L10n.welcomeScreenSubtitle, style: AppTextStyles.sfPro14Accent),
          ],
        ),

        //User Settings button
        Selector<UserDataNotifier, String>(
          selector: (context, model) => model.user.imageSrc,
          builder: (context, userImageSrc, child) {
            return UserPhoto(
              onTap: () => onUserSettingsButtonPressed(context),
              imageSrc: userImageSrc,
              size: AppDimensions.appBarUserAvatarImageSize,
            );
          },
        ),
      ],
    );
  }

  Future<void> onUserSettingsButtonPressed(BuildContext context) async {
    context.router.push(const AccountRoute());
  }
}
