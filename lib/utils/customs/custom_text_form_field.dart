import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.controller, this.label, required this.hint, required this.icon, required this.width, required this.height}) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String? label;
  final Widget icon;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: width,
        height: height,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            label: Text(label ?? ''),
            contentPadding: const EdgeInsets.all(10.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Color(0xFF295cc5),
                width: 1,
              ),
            ),
            hoverColor: Colors.transparent,
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.red,
            suffixIcon: icon,
          ),
        ),
      ),
    );
  }
}
