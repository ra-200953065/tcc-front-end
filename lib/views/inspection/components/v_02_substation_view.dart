import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/providers/inspection_provider.dart';
import 'package:tcc/widgets/input_texts/input_number_widget.dart';

class V02SubstationView extends StatefulWidget {
  const V02SubstationView({super.key});

  @override
  State<V02SubstationView> createState() => _V02SubstationViewState();
}

class _V02SubstationViewState extends State<V02SubstationView> {
  final inspectionProvider = Get.find<InspectionProvider>();

  final tlLightningRodCounterPhaseA = TextEditingController();
  final tlLightningRodCounterPhaseB = TextEditingController();
  final tlLightningRodCounterPhaseC = TextEditingController();
  final trLightningRodCounterPhaseA = TextEditingController();
  final trLightningRodCounterPhaseB = TextEditingController();
  final trLightningRodCounterPhaseC = TextEditingController();
  final dj302GasPressure = TextEditingController();
  final dj302CounterOperations = TextEditingController();

  @override
  void initState() {
    super.initState();
    tlLightningRodCounterPhaseA.text =
        inspectionProvider.tlLightningRodCounterPhaseA;
    tlLightningRodCounterPhaseB.text =
        inspectionProvider.tlLightningRodCounterPhaseB;
    tlLightningRodCounterPhaseC.text =
        inspectionProvider.tlLightningRodCounterPhaseC;
    trLightningRodCounterPhaseA.text =
        inspectionProvider.trLightningRodCounterPhaseA;
    trLightningRodCounterPhaseB.text =
        inspectionProvider.trLightningRodCounterPhaseB;
    trLightningRodCounterPhaseC.text =
        inspectionProvider.trLightningRodCounterPhaseC;
    dj302GasPressure.text = inspectionProvider.dj302GasPressure;
    dj302CounterOperations.text = inspectionProvider.dj302CounterOperations;
  }

  @override
  void dispose() {
    super.dispose();
    inspectionProvider.tlLightningRodCounterPhaseA =
        tlLightningRodCounterPhaseA.text;
    inspectionProvider.tlLightningRodCounterPhaseB =
        tlLightningRodCounterPhaseB.text;
    inspectionProvider.tlLightningRodCounterPhaseC =
        tlLightningRodCounterPhaseC.text;
    inspectionProvider.trLightningRodCounterPhaseA =
        trLightningRodCounterPhaseA.text;
    inspectionProvider.trLightningRodCounterPhaseB =
        trLightningRodCounterPhaseB.text;
    inspectionProvider.trLightningRodCounterPhaseC =
        trLightningRodCounterPhaseC.text;
    inspectionProvider.dj302GasPressure = dj302GasPressure.text;
    inspectionProvider.dj302CounterOperations = dj302CounterOperations.text;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          children: [
            InputNumberWidget(
              label: 'Disparos do Para-raios da Fase A da LT-BNE',
              controller: tlLightningRodCounterPhaseA,
              suffix: 'vezes',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Disparos do Para-raios da Fase B da LT-BNE',
              controller: tlLightningRodCounterPhaseB,
              suffix: 'vezes',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Disparos do Para-raios da Fase C da LT-BNE',
              controller: tlLightningRodCounterPhaseC,
              suffix: 'vezes',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Disparos do Para-raios da Fase A do TF1',
              controller: trLightningRodCounterPhaseA,
              suffix: 'vezes',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Disparos do Para-raios da Fase B do TF1',
              controller: trLightningRodCounterPhaseB,
              suffix: 'vezes',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Disparos do Para-raios da Fase C do TF1',
              controller: trLightningRodCounterPhaseC,
              suffix: 'vezes',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Pressão do Gás SFC do Disjuntor 302',
              controller: dj302GasPressure,
              suffix: 'bar',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Número de Operações do Disjuntor 302',
              controller: dj302CounterOperations,
              suffix: 'vezes',
              nextButton: false,
            ),
          ],
        ),
      ),
    );
  }
}
