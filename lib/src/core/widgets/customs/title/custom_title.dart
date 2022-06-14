import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final Color? color;
  final double? paddingVertical;
  final double? paddingHorizontal;

  const CustomTitle({Key? key, required this.text, this.color, this.paddingVertical, this.paddingHorizontal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 0.0, horizontal: paddingHorizontal ?? 0.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: color ?? Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
