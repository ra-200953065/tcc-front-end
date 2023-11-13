import 'package:flutter/material.dart';
import 'package:tcc/models/user_model.dart';
import 'package:tcc/widgets/buttons/elevated_button_square_widget.dart';
import 'package:tcc/widgets/input_texts/text_field_name_square_widget.dart';
import 'package:tcc/widgets/input_texts/text_field_email_square_widget.dart';
import 'package:tcc/controllers/user_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/models/api_response.dart';
import 'package:tcc/widgets/alerts/snackbar_widget.dart';

class UserAddEditView extends StatefulWidget {
  const UserAddEditView({required this.pageTitle, this.user, super.key});

  final String pageTitle;
  final UserModel? user;

  @override
  State<UserAddEditView> createState() => _UserAddEditViewState();
}

class _UserAddEditViewState extends State<UserAddEditView> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  late bool isAdmin;

  final controller = UserController();

  ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse();
  bool loading = false;

  Future<void> save() async {
    setState(() => loading = true);

    if (widget.user == null) {
      apiResponse = await controller.store(name.text, email.text, isAdmin);
    } else {
      apiResponse = await controller.update(
        widget.user!.id,
        name.text,
        email.text,
        isAdmin,
      );
    }

    switch (apiResponse.code) {
      case EnumHttpStatusCode.success:
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponse.message, false),
        );
        Navigator.of(context).pop(true);
        break;
      case EnumHttpStatusCode.gotoLogin:
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/auth/login');
        break;
      default:
        setState(() => loading = false);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarWidget(apiResponse.message, true),
          );
        }
    }
  }

  @override
  void initState() {
    super.initState();
    name.text = widget.user != null ? widget.user!.name : '';
    email.text = widget.user != null ? widget.user!.email : '';
    isAdmin = widget.user != null ? widget.user!.isAdmin : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Builder(builder: (context) {
        if (loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            child: Column(
              children: [
                textFieldNameSquareWidget(
                  label: 'Nome',
                  hint: 'Informe o nome',
                  controller: name,
                ),
                const SizedBox(height: 20),
                textFieldEmailSquareWidget(
                  label: 'E-mail',
                  hint: 'Informe o e-mail',
                  controller: email,
                ),
                const SizedBox(height: 20),
                CheckboxListTile(
                  title: const Text('Administrador'),
                  checkColor: Theme.of(context).canvasColor,
                  value: isAdmin,
                  onChanged: (value) => setState(() => isAdmin = value!),
                ),
                const SizedBox(height: 20),
                elevatedButtonSquareWidget(
                  context: context,
                  label: 'Salvar',
                  action: () => save(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
