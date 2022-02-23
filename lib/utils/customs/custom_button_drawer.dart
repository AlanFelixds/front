import 'package:flutter/material.dart';
import 'package:front_flutter/utils/themes/color_palette.dart';

class CustomButtonDrawer extends StatelessWidget {
  const CustomButtonDrawer({Key? key, required this.label, required this.icon, required this.onPressed}) : super(key: key);

  final String label;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 200,
        height: 30,
        child: Material(
          borderRadius: BorderRadius.circular(5),
          elevation: 3,
          color: ThemeColors.lightGreen,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            splashColor: Colors.red,
            hoverColor: ThemeColors.appDrawer.withOpacity(0.4),
            onTap: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 5),
                icon,
                const SizedBox(width: 10),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
