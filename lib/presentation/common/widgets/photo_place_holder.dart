import 'package:flutter/material.dart';

class PhotoPlaceHolder extends StatelessWidget {

  final Color placeholderColor;
  final double height;

  const PhotoPlaceHolder({
    this.placeholderColor = Colors.white,
    this.height = 250,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: placeholderColor,
        borderRadius: BorderRadius.circular(16),
      ),
      height: height,
      padding: EdgeInsets.all(4.0),
    );
  }
}
