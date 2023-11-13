import 'package:flutter/material.dart';
import 'package:tcc/widgets/buttons/elevated_button_square_widget.dart';
import 'package:tcc/widgets/input_texts/text_field_email_square_widget.dart';
import 'package:tcc/widgets/input_texts/text_field_password_square_widget.dart';
import 'package:tcc/widgets/buttons/text_button_rounded_widget.dart';
import 'package:tcc/controllers/auth_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/models/api_response.dart';
import 'package:tcc/models/user_model.dart';
import 'package:tcc/widgets/alerts/snackbar_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;
  ApiResponse<UserModel> apiResponse = ApiResponse();
  bool hidenPassword = true;

  Future<void> fetchLogin() async {
    final controller = AuthController();

    setState(() => loading = true);

    apiResponse = await controller.login(email.text, password.text);

    switch (apiResponse.code) {
      case EnumHttpStatusCode.success:
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case EnumHttpStatusCode.gotoResetPassword:
        if (!mounted) return;
        Navigator.pushReplacementNamed(
          context,
          '/auth/reset-password',
          arguments: {
            'email': email.text,
            'password': password.text,
          },
        );
        break;
      case EnumHttpStatusCode.message:
      case EnumHttpStatusCode.gotoLogin:
        setState(() => loading = false);

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponse.message, true),
        );
        break;
      default:
        setState(() => loading = false);
    }
  }

  @override
  void initState() {
    email.text = 'giordanigomes@gmail.com';
    password.text = 'marcio';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: SingleChildScrollView(
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
                      label: 'Senha',
                      hint: 'Informe sua senha',
                      controller: password,
                      hidenPassword: hidenPassword,
                      togglePasswordVisibility: () {
                        setState(() => hidenPassword = !hidenPassword);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    elevatedButtonSquareWidget(
                      context: context,
                      label: 'Entrar',
                      action: () => fetchLogin(),
                    ),
                    const SizedBox(height: 20.0),
                    textButtonRoundedWidget(
                      context: context,
                      label: 'Esqueci a senha',
                      action: () => Navigator.pushNamed(
                        context,
                        '/auth/forgot-password',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
