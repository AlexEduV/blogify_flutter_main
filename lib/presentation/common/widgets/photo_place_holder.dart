import 'package:flutter/material.dart';

class PhotoPlaceHolder extends StatelessWidget {

  final Color placeholderColor;

  const PhotoPlaceHolder({
    this.placeholderColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: placeholderColor,
        borderRadius: BorderRadius.circular(16),
      ),
      height: 250,
      padding: EdgeInsets.all(4.0),
    );
  }
}
