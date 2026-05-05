import 'package:flutter/cupertino.dart';

class AccountSectionItemModel {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  AccountSectionItemModel({required this.icon, required this.title, required this.onTap});
}
