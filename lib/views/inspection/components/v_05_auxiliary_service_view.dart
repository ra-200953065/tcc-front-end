import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../providers/inspection_provider.dart';
import 'package:tcc/widgets/input_texts/input_number_widget.dart';

class V05AuxiliaryServiceView extends StatefulWidget {
  const V05AuxiliaryServiceView({super.key});

  @override
  State<V05AuxiliaryServiceView> createState() =>
      _V05AuxiliaryServiceViewState();
}

class _V05AuxiliaryServiceViewState extends State<V05AuxiliaryServiceView> {
  final inspectionProvider = Get.find<InspectionProvider>();

  final asBatteryRoomTemperature = TextEditingController();
  final asBatteryRoomHumidity = TextEditingController();
  final asQDCAConsumedEnergy = TextEditingController();

  @override
  void initState() {
    super.initState();
    asBatteryRoomTemperature.text = inspectionProvider.asBatteryRoomTemperature;
    asBatteryRoomHumidity.text = inspectionProvider.asBatteryRoomHumidity;
    asQDCAConsumedEnergy.text = inspectionProvider.asQDCAConsumedEnergy;
  }

  @override
  void dispose() {
    super.dispose();
    inspectionProvider.asBatteryRoomTemperature = asBatteryRoomTemperature.text;
    inspectionProvider.asBatteryRoomHumidity = asBatteryRoomHumidity.text;
    inspectionProvider.asQDCAConsumedEnergy = asQDCAConsumedEnergy.text;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          children: [
            InputNumberWidget(
              label: 'Temperatura na Sala de Baterias',
              controller: asBatteryRoomTemperature,
              suffix: '°C',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Umidade do Ar na Sala de Baterias',
              controller: asBatteryRoomHumidity,
              suffix: '%',
              nextButton: true,
            ),
            InputNumberWidget(
              label: 'Energia Consumida no QDCA',
              controller: asQDCAConsumedEnergy,
              suffix: 'kWh',
              nextButton: false,
            ),
          ],
        ),
      ),
    );
  }
}
