import 'package:flutter/cupertino.dart';

class AccountSectionItemModel {
  final IconData icon;
  final String title;
  final Function(BuildContext)? onTap;

  AccountSectionItemModel({required this.icon, required this.title, required this.onTap});
}
