import 'package:flutter/material.dart';
import 'package:tcc/widgets/alerts/snackbar_widget.dart';
import 'package:tcc/widgets/buttons/elevated_button_square_widget.dart';
import 'package:tcc/widgets/input_texts/text_field_email_square_widget.dart';
import 'package:tcc/widgets/input_texts/text_field_password_square_widget.dart';
import 'package:tcc/controllers/auth_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/models/api_response.dart';
import 'package:tcc/models/user_model.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController email = TextEditingController();
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newPasswordConfirmation = TextEditingController();

  bool loading = false;
  ApiResponse<UserModel> apiResponse = ApiResponse();
  bool hidenCurrentPassword = true;
  bool hidenNewPassword = true;
  bool hidenNewPasswordConfirmation = true;

  Future<void> fetchResetPassword() async {
    final controller = AuthController();

    setState(() => loading = true);
    apiResponse = await controller.resetPassword(
      email.text,
      currentPassword.text,
      newPassword.text,
      newPasswordConfirmation.text,
    );

    switch (apiResponse.code) {
      case EnumHttpStatusCode.success:
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/home');
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
    email.text = widget.email;
    currentPassword.text = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Center(
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100.0,
                        child: Image.asset(
                          'assets/images/logo_no_bg.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'UHBC - Inspeções',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 2.5,
                        ),
                      ),
                      const SizedBox(height: 48.0),
                      textFieldEmailSquareWidget(
                        label: 'E-mail',
                        hint: 'Informe seu e-mail',
                        controller: email,
                      ),
                      const SizedBox(height: 20.0),
                      textFieldPasswordSquareWidget(
                        label: 'Senha atual',
                        hint: 'Senha recebida por e-mail',
                        controller: currentPassword,
                        hidenPassword: hidenCurrentPassword,
                        togglePasswordVisibility: () {
                          setState(() =>
                              hidenCurrentPassword = !hidenCurrentPassword);
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
                        label: 'Senha nova (confirmação)',
                        hint: 'Repita a senha nova',
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
                        label: 'Alterar senha',
                        action: () => fetchResetPassword(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
