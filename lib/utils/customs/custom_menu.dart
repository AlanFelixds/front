import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Material(
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Colors.green,
              hoverColor: Colors.white,
              onTap: () {},
              child: Row(
                children: const [
                  SizedBox(width: 20),
                  Icon(Icons.home),
                  SizedBox(width: 10),
                  Text("Home"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Material(
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Colors.green,
              hoverColor: Colors.white,
              onTap: () {},
              child: Row(
                children: const [
                  SizedBox(width: 20),
                  Icon(Icons.edit),
                  SizedBox(width: 10),
                  Text("Solicitar certificado"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Material(
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              splashColor: Colors.green,
              hoverColor: Colors.white,
              onTap: () {},
              child: Row(
                children: const [
                  SizedBox(width: 20),
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 10),
                  Text("Sign out"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
