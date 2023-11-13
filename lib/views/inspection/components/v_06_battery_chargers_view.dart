import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../providers/inspection_provider.dart';
import 'package:tcc/widgets/input_texts/input_number_widget.dart';

class V06BatteryChargersView extends StatefulWidget {
  const V06BatteryChargersView({super.key});

  @override
  State<V06BatteryChargersView> createState() => _V06BatteryChargersViewState();
}

class _V06BatteryChargersViewState extends State<V06BatteryChargersView> {
  final inspectionProvider = Get.find<InspectionProvider>();

  final bcCharger1InputVoltage = TextEditingController();
  final bcCharger1InputCurrent = TextEditingController();
  final bcCharger1OutputVoltage = TextEditingController();
  final bcCharger1BatteryCurrent = TextEditingController();
  final bcCharger2InputVoltage = TextEditingController();
  final bcCharger2InputCurrent = TextEditingController();
  final bcCharger2OutputVoltage = TextEditingController();
  final bcCharger2BatteryCurrent = TextEditingController();

  @override
  void initState() {
    super.initState();
    bcCharger1InputVoltage.text = inspectionProvider.bcCharger1InputVoltage;
    bcCharger1InputCurrent.text = inspectionProvider.bcCharger1InputCurrent;
    bcCharger1OutputVoltage.text = inspectionProvider.bcCharger1OutputVoltage;
    bcCharger1BatteryCurrent.text = inspectionProvider.bcCharger1BatteryCurrent;
    bcCharger2InputVoltage.text = inspectionProvider.bcCharger2InputVoltage;
    bcCharger2InputCurrent.text = inspectionProvider.bcCharger2InputCurrent;
    bcCharger2OutputVoltage.text = inspectionProvider.bcCharger2OutputVoltage;
    bcCharger2BatteryCurrent.text = inspectionProvider.bcCharger2BatteryCurrent;
  }

  @override
  void dispose() {
    super.dispose();
    inspectionProvider.bcCharger1InputVoltage = bcCharger1InputVoltage.text;
    inspectionProvider.bcCharger1InputCurrent = bcCharger1InputCurrent.text;
    inspectionProvider.bcCharger1OutputVoltage = bcCharger1OutputVoltage.text;
    inspectionProvider.bcCharger1BatteryCurrent = bcCharger1BatteryCurrent.text;
    inspectionProvider.bcCharger2InputVoltage = bcCharger2InputVoltage.text;
    inspectionProvider.bcCharger2InputCurrent = bcCharger2InputCurrent.text;
    inspectionProvider.bcCharger2OutputVoltage = bcCharger2OutputVoltage.text;
    inspectionProvider.bcCharger2BatteryCurrent = bcCharger2BatteryCurrent.text;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          children: [
            InputNumberWidget(
              label: 'Tensão de Entrada do Carregador 1',
              controller: bcCharger1InputVoltage,
              suffix: 'V',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Corrente de Entrada do Carregador 1',
              controller: bcCharger1InputCurrent,
              suffix: 'A',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Tensão de Saída do Carregador 1',
              controller: bcCharger1OutputVoltage,
              suffix: 'V',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Corrente da Bateria do Carregador 1',
              controller: bcCharger1BatteryCurrent,
              suffix: 'A',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Tensão de Entrada do Carregador 2',
              controller: bcCharger2InputVoltage,
              suffix: 'V',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Corrente de Entrada do Carregador 2',
              controller: bcCharger2InputCurrent,
              suffix: 'A',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Tensão de Saída do Carregador 2',
              controller: bcCharger2OutputVoltage,
              suffix: 'V',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Corrente da Bateria do Carregador 2',
              controller: bcCharger2BatteryCurrent,
              suffix: 'A',
              nextButton: false,
            ),
          ],
        ),
      ),
    );
  }
}
