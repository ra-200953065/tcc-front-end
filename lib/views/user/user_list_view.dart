import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/providers/auth_provider.dart';
import 'package:tcc/controllers/user_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/models/api_response.dart';
import 'package:tcc/models/user_model.dart';
import 'package:tcc/widgets/alerts/snackbar_widget.dart';
import 'package:tcc/widgets/dialogs/confirm_widget.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  bool loading = false;
  ApiResponse<List<UserModel>> apiResponseGetUsers = ApiResponse();
  ApiResponse<Map<String, dynamic>> apiResponseDeleteUser = ApiResponse();
  final controller = UserController();
  final _authProvider = Get.put(AuthProvider());

  Future<void> fetchGetAll() async {
    setState(() => loading = true);
    apiResponseGetUsers = await controller.getAll();

    switch (apiResponseGetUsers.code) {
      case EnumHttpStatusCode.gotoLogin:
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/auth/login');
        break;
      case EnumHttpStatusCode.message:
        setState(() => loading = false);

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponseGetUsers.message, true),
        );
        break;
      default:
        setState(() => loading = false);
    }
  }

  Future<void> fetchDelete(int id) async {
    setState(() => loading = true);

    apiResponseDeleteUser = await controller.delete(id);

    switch (apiResponseDeleteUser.code) {
      case EnumHttpStatusCode.success:
        await fetchGetAll();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponseDeleteUser.message, false),
        );
        break;
      case EnumHttpStatusCode.gotoLogin:
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/auth/login');
        break;
      case EnumHttpStatusCode.message:
        setState(() => loading = false);

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponseDeleteUser.message, true),
        );
        break;
      default:
        setState(() => loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchGetAll();
  }

  final authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        actions: [
          IconButton(
            tooltip: 'Novo usuário',
            onPressed: () {
              Navigator.pushNamed(context, '/users/add').then((value) {
                if (value != null) {
                  fetchGetAll();
                }
              });
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Builder(builder: (context) {
        if (loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (apiResponseGetUsers.data == null ||
            apiResponseGetUsers.data!.isEmpty) {
          return const Center(
              child: Text(
            'Sem dados para exibir',
            style: TextStyle(fontSize: 20),
          ));
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: RefreshIndicator(
              onRefresh: () => fetchGetAll(),
              child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemCount: apiResponseGetUsers.data!.length,
                itemBuilder: (context, index) {
                  final item = apiResponseGetUsers.data![index];
                  return ListTile(
                    key: ValueKey(item.id),
                    leading: Icon(
                      item.isAdmin
                          ? Icons.person_add_alt
                          : Icons.person_outline,
                      color: Colors.teal,
                      size: 22,
                    ),
                    title: Text(
                      item.name,
                      style: const TextStyle(fontSize: 17),
                    ),
                    subtitle: Text(item.email),
                    trailing: PopupMenuButton<String>(
                      tooltip: 'Exibir menu',
                      itemBuilder: (context) => [
                        const PopupMenuItem<String>(
                          value: 'edit',
                          child: Text('Editar'),
                        ),
                        PopupMenuItem<String>(
                          value: 'delete',
                          enabled: item.id != _authProvider.userId,
                          child: const Text('Excluir'),
                        ),
                      ],
                      onSelected: (value) async {
                        if (value == 'edit') {
                          Navigator.pushNamed(
                            context,
                            '/user/edit',
                            arguments: item,
                          ).then((value) {
                            if (value == true) {
                              fetchGetAll();
                            }
                          });
                        }

                        if (value == 'delete') {
                          bool? res = await confirmWidget(
                            context,
                            'Atenção',
                            'Confirma a exclusão do item?',
                          );

                          res = res ?? false;

                          if (res) {
                            fetchDelete(item.id);
                          }
                        }
                      },
                    ),
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        '/user/edit',
                        arguments: item,
                      ).then((value) {
                        if (value != null) {
                          fetchGetAll();
                        }
                      });
                    },
                  );
                },
              ),
            ),
          );
        }
      }),
    );
  }
}
