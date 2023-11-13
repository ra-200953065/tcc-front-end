import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/controllers/inspection_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/providers/auth_provider.dart';
import 'package:tcc/providers/inspection_provider.dart';
import 'package:tcc/widgets/buttons/elevated_button_square_widget.dart';
import 'package:tcc/widgets/input_selects/input_select_widget.dart';
import '../../../models/api_response.dart';
import '../../../widgets/alerts/snackbar_widget.dart';
import 'package:tcc/widgets/input_texts/input_number_widget.dart';

class V10FinalizeView extends StatefulWidget {
  const V10FinalizeView({super.key});

  @override
  State<V10FinalizeView> createState() => _V10FinalizeViewState();
}

class _V10FinalizeViewState extends State<V10FinalizeView> {
  final inspectionProvider = Get.find<InspectionProvider>();
  final authProvider = Get.put(AuthProvider());
  final inspectionController = InspectionController();
  ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse();
  bool loading = false;

  String? weatherCondition;
  TextEditingController ambientTemperature = TextEditingController();

  @override
  void initState() {
    super.initState();
    weatherCondition = inspectionProvider.weatherCondition;
    ambientTemperature.text = inspectionProvider.ambientTemperature;
  }

  void save() async {
    inspectionProvider.weatherCondition = weatherCondition;
    inspectionProvider.ambientTemperature = ambientTemperature.text;

    if (inspectionProvider.isDataValid() == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBarWidget('Preencha todos os campos', true),
      );
    } else {
      setState(() => loading = true);

      apiResponse = await inspectionController.store(
        inspectionProvider.getData(authProvider.userId),
      );

      switch (apiResponse.code) {
        case EnumHttpStatusCode.success:
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarWidget('Inspeção realizada com sucesso', false),
          );

          Navigator.of(context).pop(true);
          break;
        case EnumHttpStatusCode.gotoLogin:
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
          setState(() => loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            InputSelectWidget(
              label: 'Condições Climáticas',
              items: const ['Ensolarado', 'Chuvoso', 'Nublado'],
              fn: (value) =>
                  setState(() => weatherCondition = value.toString()),
              initValue: weatherCondition,
            ),
            InputNumberWidget(
              label: 'Temperatura Ambiente',
              controller: ambientTemperature,
              suffix: '°C',
              nextButton: false,
            ),
            elevatedButtonSquareWidget(
              context: context,
              label: 'Finalizar',
              action: () => save(),
            ),
          ],
        ),
      ),
    );
  }
}
