import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/providers/auth_provider.dart';
import 'package:tcc/widgets/dialogs/confirm_widget.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({
    super.key,
  });

  final _authProvider = Get.put(AuthProvider());

  @override
  Widget build(BuildContext context) {
    Widget customListTile(
      String title,
      IconData icon,
      String route,
      bool checkIfAdmin,
    ) {
      return ListTile(
        enabled: !checkIfAdmin || _authProvider.userIsAdmin,
        // enabled: true,
        leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed(route);
        },
      );
    }

    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      'UHBC - Inspeções',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.7,
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Material(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _authProvider.userName,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  _authProvider.userEmail,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/profile/home');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                customListTile(
                  'Inspeções',
                  Icons.check_box_outlined,
                  '/inspections',
                  false,
                ),
                customListTile(
                  'Usuários',
                  Icons.people_alt_outlined,
                  '/users',
                  true,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListTile(
            dense: true,
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Perfil', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profile/home');
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.exit_to_app_outlined),
            title: const Text('Sair', style: TextStyle(fontSize: 16)),
            onTap: () async {
              bool? res = await confirmWidget(
                context,
                'Atenção',
                'Deseja efetuar logout?',
              );

              if (res == true) {
                if (context.mounted) {
                  Navigator.pushReplacementNamed(context, '/auth/logout');
                }
              } else {
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
