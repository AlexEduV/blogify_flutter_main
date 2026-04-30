import 'package:flutter/cupertino.dart';

import '../../../../common/app_text_styles.dart';
import '../../../../l10n/l10n.dart';

class AppVersionFooter extends StatelessWidget {
  const AppVersionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('${L10n.appName}, ${L10n.appVersion}', style: AppTextStyles.sfPro14Accent);
  }
}
