import 'package:flutter/material.dart';

class PostCoverPhoto extends StatelessWidget {

  final String imageSrc;
  final Color placeholderColor;
  final double height;

  const PostCoverPhoto({
    this.placeholderColor = Colors.white,
    this.imageSrc = '',
    this.height = 250,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: imageSrc.isEmpty ? placeholderColor : null,
        image: (imageSrc.isNotEmpty) ? DecorationImage(
          image: AssetImage(imageSrc,),
          fit: BoxFit.cover,
        ) : null,
        borderRadius: BorderRadius.circular(16),
      ),
      height: height,
      padding: const EdgeInsets.all(4.0),
    );
  }
}
