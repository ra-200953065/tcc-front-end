import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/providers/auth_provider.dart';
import 'package:tcc/widgets/alerts/snackbar_widget.dart';
import 'package:tcc/widgets/buttons/elevated_button_square_widget.dart';
import 'package:tcc/widgets/input_texts/text_field_email_square_widget.dart';
import 'package:tcc/widgets/input_texts/text_field_name_square_widget.dart';
import 'package:tcc/controllers/auth_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/models/api_response.dart';

class ChangeProfileView extends StatefulWidget {
  const ChangeProfileView({super.key});

  @override
  State<ChangeProfileView> createState() => _ChangeProfileViewState();
}

class _ChangeProfileViewState extends State<ChangeProfileView> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  final _authProvider = Get.put(AuthProvider());
  final authController = AuthController();
  ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse();
  bool loading = false;

  fetchChangeProfile() async {
    setState(() => loading = true);
    apiResponse = await authController.changeProfile(name.text, email.text);

    switch (apiResponse.code) {
      case EnumHttpStatusCode.success:
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponse.message, false),
        );

        Navigator.of(context).pop();
        break;
      case EnumHttpStatusCode.gotoLogin:
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/auth/login');
        break;
      default:
        setState(() => loading = false);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarWidget(apiResponse.message, false),
          );
        }
    }
  }

  @override
  void initState() {
    super.initState();
    name.text = _authProvider.userName;
    email.text = _authProvider.userEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar Perfil'),
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
                  hint: 'Informe seu noe',
                  controller: name,
                ),
                const SizedBox(height: 20.0),
                textFieldEmailSquareWidget(
                  label: 'E-mail',
                  hint: 'Informe seu e-email',
                  controller: email,
                ),
                const SizedBox(height: 20.0),
                elevatedButtonSquareWidget(
                  context: context,
                  label: 'Salvar',
                  action: () => fetchChangeProfile(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
