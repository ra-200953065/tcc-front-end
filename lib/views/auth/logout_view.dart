import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/widgets/alerts/snackbar_widget.dart';
import '../../controllers/auth_controller.dart';
import '../../helpers/enum_http_status_code.dart';
import '../../models/api_response.dart';
import '../../providers/app_provider.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({super.key});

  @override
  State<LogoutView> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  final appProvider = Get.put(AppProvider());

  bool loading = false;
  ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse();

  Future<void> fetchLogout() async {
    final controller = AuthController();

    setState(() => loading = true);
    apiResponse = await controller.logout();

    switch (apiResponse.code) {
      case EnumHttpStatusCode.success:
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/auth/login');
        break;
      case EnumHttpStatusCode.message:
        setState(() => loading = false);

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarWidget(apiResponse.message, true),
        );
        break;
      default:
        if (context.mounted) Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLogout();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
