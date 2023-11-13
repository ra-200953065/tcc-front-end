import 'package:flutter/material.dart';
import 'package:tcc/widgets/alerts/snackbar_widget.dart';
import 'package:tcc/widgets/buttons/elevated_button_square_widget.dart';
import 'package:tcc/widgets/input_texts/text_field_email_square_widget.dart';
import 'package:tcc/controllers/auth_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/models/api_response.dart';
import 'package:tcc/models/user_model.dart';
import 'package:tcc/widgets/buttons/text_button_rounded_widget.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController email = TextEditingController();

  bool loading = false;
  ApiResponse<UserModel> apiResponse = ApiResponse();
  bool hidenPassword = true;

  Future<void> fetchForgotPassword() async {
    final controller = AuthController();

    setState(() => loading = true);
    apiResponse = await controller.forgotPassword(email.text);

    switch (apiResponse.code) {
      case EnumHttpStatusCode.success:
        if (!mounted) return;
        Navigator.pushReplacementNamed(
          context,
          '/auth/reset-password',
          arguments: {
            'email': email.text,
            'password': '',
          },
        );
        break;
      case EnumHttpStatusCode.message:
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
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Row(
                        children: const [
                          Flexible(
                            child: Text(
                              'Informe seu e-mail cadastrado no aplicativo para receber uma nova senha.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48.0),
                    textFieldEmailSquareWidget(
                      label: 'E-mail',
                      hint: 'Informe seu e-mail',
                      controller: email,
                    ),
                    const SizedBox(height: 20.0),
                    elevatedButtonSquareWidget(
                      context: context,
                      label: 'Recuperar senha',
                      action: () => fetchForgotPassword(),
                    ),
                    const SizedBox(height: 20.0),
                    textButtonRoundedWidget(
                      context: context,
                      label: 'Voltar para Login',
                      action: () => Navigator.pop(context),
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
