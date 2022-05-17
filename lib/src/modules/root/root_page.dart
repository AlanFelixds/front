import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/widgets/customs/drawer/custom_drawer.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      drawer: MediaQuery.of(context).size.width < 900 ? const CustomDrawer() : null,
      body: Row(
        children: [
          MediaQuery.of(context).size.width >= 900 ? const CustomDrawer() : const SizedBox(),
          // NavigationListener(
          //   builder: (context, child) {
          //     return SizedBox(
          //       width: 300,
          //       child: Column(
          //         children: [
          //           SizedBox(
          //             width: 250,
          //             child: Column(
          //               children: [
          //                 MenuListTile(
          //                   title: 'Home',
          //                   onTap: () => Modular.to.pushNamed('/home/dashboard/'),
          //                   selected: Modular.to.path.endsWith('/dashboard/'),
          //                   trailing: const Icon(Icons.home),
          //                 ),
          //                 MenuListTile(
          //                   title: 'Solicitação',
          //                   onTap: () => Modular.to.pushNamed('/home/solicitacao/'),
          //                   selected: Modular.to.path.endsWith('/solicitacao/'),
          //                   trailing: const Icon(Icons.post_add_rounded),
          //                 ),
          //                 MenuListTile(
          //                   title: 'Solicitações',
          //                   onTap: () => Modular.to.pushNamed('/home/solicitacoes/'),
          //                   selected: Modular.to.path.endsWith('/solicitacoes/'),
          //                   trailing: const Icon(Icons.view_list_rounded),
          //                 ),
          //                 MenuListTile(
          //                   title: 'Sair',
          //                   onTap: () => Modular.to.popAndPushNamed('/login'),
          //                   trailing: const Icon(Icons.logout_rounded),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),
          const Expanded(child: RouterOutlet())
        ],
      ),
    );
  }
}
