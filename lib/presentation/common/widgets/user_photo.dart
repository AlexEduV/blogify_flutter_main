import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {

  final String imageSrc;

  const UserPhoto({
    required this.imageSrc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imageSrc),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
