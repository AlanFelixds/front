import 'package:flutter/material.dart';
import 'package:front_flutter/utils/routes/routes.dart';
import 'package:get/get.dart';

class NavigatorContent extends StatelessWidget {
  const NavigatorContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.pickPages(
      emptyWidget: (delegate) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/logo_drawer.png'),
            opacity: 0.5,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
      ),
      pickPages: (currentNavStack) {
        return currentNavStack.currentTreeBranch.pickAfterRoute(Routes.home);
      },
    );
  }
}
