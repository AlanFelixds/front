import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  final String caminhoIMG;
  final Function(String?)? onChanged;
  final String value;
  final String groupValue;
  const CardTemplate({Key? key, required this.caminhoIMG, required this.onChanged, required this.value, required this.groupValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(caminhoIMG, width: 350, height: 350, fit: BoxFit.fill),
          ),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: Radio(
            toggleable: true,
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          // child: Icon(Icons.check),
        ),
      ],
    );
  }
}
