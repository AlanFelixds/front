import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/core/widgets/customs/drawer/menu_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationListener(
      builder: (context, child) {
        return SizedBox(
          width: 300,
          child: Column(
            children: [
              SizedBox(
                width: 250,
                child: Column(
                  children: [
                    MenuListTile(
                      title: 'Home',
                      // onTap: () => Modular.to.pushNamed('/home/dashboard/'),
                      onTap: () => Modular.to.navigate('/home/dashboard/'),
                      selected: Modular.to.path.endsWith('/dashboard/'),
                      trailing: const Icon(Icons.home),
                    ),
                    MenuListTile(
                      title: 'Criar evento',
                      onTap: () => Modular.to.navigate('/home/evento/'),
                      selected: Modular.to.path.endsWith('/evento/'),
                      trailing: const Icon(Icons.post_add_rounded),
                    ),
                    MenuListTile(
                      title: 'Eventos',
                      onTap: () => Modular.to.navigate('/home/solicitacoes/'),
                      selected: Modular.to.path.endsWith('/solicitacoes/'),
                      trailing: const Icon(Icons.list_alt_rounded),
                    ),
                    MenuListTile(
                      title: 'Sair',
                      onTap: () => Modular.to.popAndPushNamed('/login'),
                      trailing: const Icon(Icons.logout_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
