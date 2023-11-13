import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/widgets/input_selects/input_select_widget.dart';
import '../../../providers/inspection_provider.dart';
import 'package:tcc/widgets/input_texts/input_number_widget.dart';

class V03TransformerView extends StatefulWidget {
  const V03TransformerView({super.key});

  @override
  State<V03TransformerView> createState() => _V03TransformerViewtState();
}

class _V03TransformerViewtState extends State<V03TransformerView> {
  final inspectionProvider = Get.find<InspectionProvider>();

  final trOilTemperature = TextEditingController();
  final trCoilHVTemperature = TextEditingController();
  final trCoilLVTemperature = TextEditingController();
  String? trOilLevel;
  String? trSilicaGel;

  @override
  void initState() {
    super.initState();
    trOilTemperature.text = inspectionProvider.trOilTemperature;
    trCoilHVTemperature.text = inspectionProvider.trCoilHVTemperature;
    trCoilLVTemperature.text = inspectionProvider.trCoilLVTemperature;
    trOilLevel = inspectionProvider.trOilLevel;
    trSilicaGel = inspectionProvider.trSilicaGel;
  }

  @override
  void dispose() {
    super.dispose();
    inspectionProvider.trOilTemperature = trOilTemperature.text;
    inspectionProvider.trCoilHVTemperature = trCoilHVTemperature.text;
    inspectionProvider.trCoilLVTemperature = trCoilLVTemperature.text;
    inspectionProvider.trOilLevel = trOilLevel;
    inspectionProvider.trSilicaGel = trSilicaGel;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          children: [
            InputNumberWidget(
              label: 'Temperatura do Óleo',
              controller: trOilTemperature,
              suffix: '°C',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Temperatura do Enrolamento AT',
              controller: trCoilHVTemperature,
              suffix: '°C',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Temperatura do Enrolamento BT',
              controller: trCoilLVTemperature,
              suffix: '°C',
              nextButton: false,
            ),
            InputSelectWidget(
              label: 'Nível do Óleo',
              items: const ['Baixo', 'Normal', 'Alto'],
              fn: (value) => setState(() => trOilLevel = value.toString()),
              initValue: trOilLevel,
            ),
            InputSelectWidget(
              label: 'Sílica Gel',
              items: const ['Saturada', 'Normal', 'Ausente'],
              fn: (value) => setState(() => trSilicaGel = value.toString()),
              initValue: trSilicaGel,
            ),
          ],
        ),
      ),
    );
  }
}
