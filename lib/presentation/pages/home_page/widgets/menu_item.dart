import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;

  const MenuItem({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.black, width: 1.0,),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
