import 'package:flutter/material.dart';

class PhotoPlaceHolder extends StatelessWidget {

  final String imageSrc;
  final Color placeholderColor;
  final double height;

  const PhotoPlaceHolder({
    this.placeholderColor = Colors.white,
    this.imageSrc = '',
    this.height = 250,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        //color: placeholderColor,
        image: DecorationImage(
          image: AssetImage(imageSrc,),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      height: height,
      padding: const EdgeInsets.all(4.0),
    );
  }
}
