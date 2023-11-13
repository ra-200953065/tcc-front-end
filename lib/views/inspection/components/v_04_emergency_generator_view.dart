import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../providers/inspection_provider.dart';
import 'package:tcc/widgets/input_selects/input_select_widget.dart';
import 'package:tcc/widgets/input_texts/input_number_widget.dart';

class V04EmergencyGeneratorView extends StatefulWidget {
  const V04EmergencyGeneratorView({super.key});

  @override
  State<V04EmergencyGeneratorView> createState() =>
      _V04EmergencyGeneratorViewState();
}

class _V04EmergencyGeneratorViewState extends State<V04EmergencyGeneratorView> {
  final inspectionProvider = Get.find<InspectionProvider>();

  TextEditingController egEngineTemperature = TextEditingController();
  String? egOilLevel;
  TextEditingController egBatteryVoltage = TextEditingController();
  String? egWaterLevelRadiator;

  @override
  void initState() {
    super.initState();
    egEngineTemperature.text = inspectionProvider.egEngineTemperature;
    egOilLevel = inspectionProvider.egOilLevel;
    egBatteryVoltage.text = inspectionProvider.egBatteryVoltage;
    egWaterLevelRadiator = inspectionProvider.egWaterLevelRadiator;
  }

  @override
  void dispose() {
    super.dispose();
    inspectionProvider.egEngineTemperature = egEngineTemperature.text;
    inspectionProvider.egOilLevel = egOilLevel;
    inspectionProvider.egBatteryVoltage = egBatteryVoltage.text;
    inspectionProvider.egWaterLevelRadiator = egWaterLevelRadiator;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          children: [
            InputNumberWidget(
              label: 'Tensão da Bateria',
              controller: egBatteryVoltage,
              suffix: 'V',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Temperatura do Motor',
              controller: egEngineTemperature,
              suffix: '°C',
              nextButton: false,
            ),
            InputSelectWidget(
              label: 'Nível do Óleo',
              items: const ['Baixo', 'Normal', 'Alto'],
              fn: (value) => setState(() => egOilLevel = value.toString()),
              initValue: egOilLevel,
            ),
            InputSelectWidget(
              label: 'Nível de Água no Radiador',
              items: const ['Baixo', 'Normal', 'Alto'],
              fn: (value) =>
                  setState(() => egWaterLevelRadiator = value.toString()),
              initValue: egWaterLevelRadiator,
            ),
          ],
        ),
      ),
    );
  }
}
