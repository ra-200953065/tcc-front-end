import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/widgets/input_selects/input_select_widget.dart';
import '../../../providers/inspection_provider.dart';

class V08HydraulicStationsView extends StatefulWidget {
  const V08HydraulicStationsView({super.key});

  @override
  State<V08HydraulicStationsView> createState() =>
      _V08HydraulicStationsViewState();
}

class _V08HydraulicStationsViewState extends State<V08HydraulicStationsView> {
  final inspectionProvider = Get.find<InspectionProvider>();

  String? hsUHLM1;
  String? hsUHRV1;
  String? hsUHLM2;
  String? hsUHRV2;
  String? hsCompressor1OilLevel;
  String? hsCompressor2OilLevel;

  @override
  void initState() {
    super.initState();
    hsUHLM1 = inspectionProvider.hsUHLM1;
    hsUHRV1 = inspectionProvider.hsUHRV1;
    hsUHLM2 = inspectionProvider.hsUHLM2;
    hsUHRV2 = inspectionProvider.hsUHRV2;
    hsCompressor1OilLevel = inspectionProvider.hsCompressor1OilLevel;
    hsCompressor2OilLevel = inspectionProvider.hsCompressor2OilLevel;
  }

  @override
  void dispose() {
    super.dispose();
    inspectionProvider.hsUHLM1 = hsUHLM1;
    inspectionProvider.hsUHRV1 = hsUHRV1;
    inspectionProvider.hsUHLM2 = hsUHLM2;
    inspectionProvider.hsUHRV2 = hsUHRV2;
    inspectionProvider.hsCompressor1OilLevel = hsCompressor1OilLevel;
    inspectionProvider.hsCompressor2OilLevel = hsCompressor2OilLevel;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          children: [
            InputSelectWidget(
              label: 'UHLM 1',
              items: const ['Normal', 'Possui vazamentos', 'Fora de operação'],
              fn: (value) => setState(() => hsUHLM1 = value.toString()),
              initValue: hsUHLM1,
            ),
            InputSelectWidget(
              label: 'UHRV 1',
              items: const ['Normal', 'Possui vazamentos', 'Fora de operação'],
              fn: (value) => setState(() => hsUHRV1 = value.toString()),
              initValue: hsUHRV1,
            ),
            InputSelectWidget(
              label: 'UHLM 2',
              items: const ['Normal', 'Possui vazamentos', 'Fora de operação'],
              fn: (value) => setState(() => hsUHLM2 = value.toString()),
              initValue: hsUHLM2,
            ),
            InputSelectWidget(
              label: 'UHRV 2',
              items: const ['Normal', 'Possui vazamentos', 'Fora de operação'],
              fn: (value) => setState(() => hsUHRV2 = value.toString()),
              initValue: hsUHRV2,
            ),
            InputSelectWidget(
              label: 'Nível de Óleo do Compressor 1',
              items: const ['Baixo', 'Normal', 'Alto'],
              fn: (value) =>
                  setState(() => hsCompressor1OilLevel = value.toString()),
              initValue: hsCompressor1OilLevel,
            ),
            InputSelectWidget(
              label: 'Nível de Óleo do Compressor 2',
              items: const ['Baixo', 'Normal', 'Alto'],
              fn: (value) =>
                  setState(() => hsCompressor2OilLevel = value.toString()),
              initValue: hsCompressor2OilLevel,
            ),
          ],
        ),
      ),
    );
  }
}
