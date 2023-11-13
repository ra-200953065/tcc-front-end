import 'package:flutter/material.dart';
import 'package:tcc/controllers/auth_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/models/api_response.dart';
import 'package:tcc/widgets/dialogs/retry_request_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse();
  final controller = AuthController();

  Future<void> fetchVerifyToken() async {
    apiResponse = await controller.validateToken();
    setState(() {});

    if (apiResponse.code == EnumHttpStatusCode.success) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    }

    if (apiResponse.code == EnumHttpStatusCode.gotoLogin) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/auth/login');
    }
  }

  @override
  void initState() {
    fetchVerifyToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (apiResponse.code == EnumHttpStatusCode.timeout) {
            return retryRequestWidget(fn: fetchVerifyToken);
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class RetryRequestWidget {}
