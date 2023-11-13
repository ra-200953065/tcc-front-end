import 'package:flutter/material.dart';
import 'package:tcc/widgets/alerts/snackbar_widget.dart';
import 'package:tcc/widgets/buttons/elevated_button_square_widget.dart';
import 'package:tcc/widgets/input_texts/text_field_password_square_widget.dart';
import 'package:tcc/controllers/auth_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/models/api_response.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final newPasswordConfirmation = TextEditingController();

  bool hidenCurrentPassword = true;
  bool hidenNewPassword = true;
  bool hidenNewPasswordConfirmation = true;

  final authController = AuthController();
  ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse();
  bool loading = false;

  fetchChangePassword() async {
    setState(() => loading = true);

    apiResponse = await authController.changePassword(
      currentPassword.text,
      newPassword.text,
      newPasswordConfirmation.text,
    );

    switch (apiResponse.code) {
      case EnumHttpStatusCode.success:
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponse.message, false),
        );
        Navigator.of(context).pop();
        break;
      case EnumHttpStatusCode.gotoLogin:
        setState(() => loading = false);

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponse.message, true),
        );
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar Senha'),
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
                textFieldPasswordSquareWidget(
                  label: 'Senha atual',
                  hint: 'Informe a senha atual',
                  controller: currentPassword,
                  hidenPassword: hidenCurrentPassword,
                  togglePasswordVisibility: () {
                    setState(
                      () => hidenCurrentPassword = !hidenCurrentPassword,
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                textFieldPasswordSquareWidget(
                  label: 'Senha nova',
                  hint: 'Informe a senha nova',
                  controller: newPassword,
                  hidenPassword: hidenNewPassword,
                  togglePasswordVisibility: () {
                    setState(() => hidenNewPassword = !hidenNewPassword);
                  },
                ),
                const SizedBox(height: 20.0),
                textFieldPasswordSquareWidget(
                  label: 'Confirmação de senha',
                  hint: 'Informe novamente a senha nova',
                  controller: newPasswordConfirmation,
                  hidenPassword: hidenNewPasswordConfirmation,
                  togglePasswordVisibility: () {
                    setState(() => hidenNewPasswordConfirmation =
                        !hidenNewPasswordConfirmation);
                  },
                ),
                const SizedBox(height: 20.0),
                elevatedButtonSquareWidget(
                  context: context,
                  label: 'Salvar',
                  action: () => fetchChangePassword(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
