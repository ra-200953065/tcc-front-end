import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../providers/inspection_provider.dart';
import 'package:tcc/widgets/input_texts/input_number_widget.dart';

class V07WaterSupplyView extends StatefulWidget {
  const V07WaterSupplyView({super.key});

  @override
  State<V07WaterSupplyView> createState() => _V07WaterSupplyViewState();
}

class _V07WaterSupplyViewState extends State<V07WaterSupplyView> {
  final inspectionProvider = Get.find<InspectionProvider>();

  final wsGridAmountLevel = TextEditingController();
  final wsGridDownstreamLevel = TextEditingController();
  final wsWatergateDownstreamLevel = TextEditingController();
  final wsUG1Power = TextEditingController();
  final wsUG2Power = TextEditingController();

  @override
  void initState() {
    super.initState();
    wsGridAmountLevel.text = inspectionProvider.wsGridAmountLevel;
    wsGridDownstreamLevel.text = inspectionProvider.wsGridDownstreamLevel;
    wsWatergateDownstreamLevel.text =
        inspectionProvider.wsWatergateDownstreamLevel;
    wsUG1Power.text = inspectionProvider.wsUG1Power;
    wsUG2Power.text = inspectionProvider.wsUG2Power;
  }

  @override
  void dispose() {
    super.dispose();
    inspectionProvider.wsGridAmountLevel = wsGridAmountLevel.text;
    inspectionProvider.wsGridDownstreamLevel = wsGridDownstreamLevel.text;
    inspectionProvider.wsWatergateDownstreamLevel =
        wsWatergateDownstreamLevel.text;
    inspectionProvider.wsUG1Power = wsUG1Power.text;
    inspectionProvider.wsUG2Power = wsUG2Power.text;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          children: [
            InputNumberWidget(
              label: 'Nível Montante à Grade',
              controller: wsGridAmountLevel,
              suffix: 'm',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Nível Jusante à Grade',
              controller: wsGridDownstreamLevel,
              suffix: 'm',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Nível Jusante à Comporta',
              controller: wsWatergateDownstreamLevel,
              suffix: 'm',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Potência da UGG01',
              controller: wsUG1Power,
              suffix: 'MW',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Potência da UGG02',
              controller: wsUG2Power,
              suffix: 'MW',
              nextButton: false,
            ),
          ],
        ),
      ),
    );
  }
}
