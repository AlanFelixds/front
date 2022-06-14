import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? icon;
  final TextEditingController textController;
  final String? hint;
  final bool blPassword;
  final double? width;

  const CustomTextFormField({
    Key? key,
    required this.textController,
    this.icon,
    this.hint,
    this.blPassword = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: width ?? 300,
        height: 40,
        child: TextFormField(
          controller: textController,
          cursorColor: Colors.green,
          obscureText: blPassword ? true : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[400]),
            contentPadding: const EdgeInsets.all(10.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey[600]!, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey[600]!, width: 1),
            ),
            hoverColor: Colors.transparent,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: icon,
          ),
        ),
      ),
    );
  }
}
