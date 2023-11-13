import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../providers/inspection_provider.dart';
import 'package:tcc/widgets/input_texts/input_number_widget.dart';

class V09TurbineSealView extends StatefulWidget {
  const V09TurbineSealView({super.key});

  @override
  State<V09TurbineSealView> createState() => _V09TurbineSealViewState();
}

class _V09TurbineSealViewState extends State<V09TurbineSealView> {
  final inspectionProvider = Get.find<InspectionProvider>();

  final tsUG1SealWaterPressure = TextEditingController();
  final tsUG1AuxiliaryWaterPressure = TextEditingController();
  final tsUG1SealWaterFlow = TextEditingController();
  final tsUG2SealWaterPressure = TextEditingController();
  final tsUG2AuxiliaryWaterPressure = TextEditingController();
  final tsUG2SealWaterFlow = TextEditingController();

  @override
  void initState() {
    super.initState();
    tsUG1SealWaterPressure.text = inspectionProvider.tsUG1SealWaterPressure;
    tsUG1AuxiliaryWaterPressure.text =
        inspectionProvider.tsUG1AuxiliaryWaterPressure;
    tsUG1SealWaterFlow.text = inspectionProvider.tsUG1SealWaterFlow;
    tsUG2SealWaterPressure.text = inspectionProvider.tsUG2SealWaterPressure;
    tsUG2AuxiliaryWaterPressure.text =
        inspectionProvider.tsUG2AuxiliaryWaterPressure;
    tsUG2SealWaterFlow.text = inspectionProvider.tsUG2SealWaterFlow;
  }

  @override
  void dispose() {
    super.dispose();
    inspectionProvider.tsUG1SealWaterPressure = tsUG1SealWaterPressure.text;
    inspectionProvider.tsUG1AuxiliaryWaterPressure =
        tsUG1AuxiliaryWaterPressure.text;
    inspectionProvider.tsUG1SealWaterFlow = tsUG1SealWaterFlow.text;
    inspectionProvider.tsUG2SealWaterPressure = tsUG2SealWaterPressure.text;
    inspectionProvider.tsUG2AuxiliaryWaterPressure =
        tsUG2AuxiliaryWaterPressure.text;
    inspectionProvider.tsUG2SealWaterFlow = tsUG2SealWaterFlow.text;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          children: [
            InputNumberWidget(
              label: 'Pressão de Água no Selo da UGG01',
              controller: tsUG1SealWaterPressure,
              suffix: 'bar',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Pressão de Água Auxiliar da UGG01',
              controller: tsUG1AuxiliaryWaterPressure,
              suffix: 'bar',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Fluxo de Água no Selo da UGG01',
              controller: tsUG1SealWaterFlow,
              suffix: 'lpm',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Pressão de Água no Selo da UGG02',
              controller: tsUG2SealWaterPressure,
              suffix: 'bar',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Pressão de Água Auxiliar da UGG02',
              controller: tsUG2AuxiliaryWaterPressure,
              suffix: 'bar',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Fluxo de Água no Selo da UGG02',
              controller: tsUG2SealWaterFlow,
              suffix: 'lpm',
              nextButton: false,
            ),
          ],
        ),
      ),
    );
  }
}
