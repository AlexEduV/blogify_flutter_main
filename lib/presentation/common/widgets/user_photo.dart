import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {

  final String imageSrc;
  final double size;

  const UserPhoto({
    required this.imageSrc,
    this.size = 80,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: imageSrc.isNotEmpty ? DecorationImage(
          image: AssetImage(imageSrc),
          fit: BoxFit.cover,
        ) : null,
        color: imageSrc.isNotEmpty ? null : Colors.grey[400],
      ),
    );
  }
}
