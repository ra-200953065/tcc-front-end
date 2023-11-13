import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/views/inspection/components/v_02_substation_view.dart';
import 'package:tcc/views/inspection/components/v_03_transformer_view.dart';
import 'package:tcc/views/inspection/components/v_04_emergency_generator_view.dart';
import 'package:tcc/views/inspection/components/v_05_auxiliary_service_view.dart';
import 'package:tcc/views/inspection/components/v_06_battery_chargers_view.dart';
import 'package:tcc/views/inspection/components/v_07_water_supply_view.dart';
import 'package:tcc/views/inspection/components/v_08_hydraulic_stations_view.dart';
import 'package:tcc/views/inspection/components/v_09_turbine_seal_view.dart';
import 'package:tcc/views/inspection/components/v_10_finalize_view.dart';
import '../../../providers/inspection_provider.dart';

class V01InspectionsAddTopView extends StatefulWidget {
  const V01InspectionsAddTopView({super.key});

  @override
  State<V01InspectionsAddTopView> createState() =>
      _V01InspectionsAddTopViewState();
}

class _V01InspectionsAddTopViewState extends State<V01InspectionsAddTopView>
    with SingleTickerProviderStateMixin {
  late TabController _tabViewController;
  final inspectionProvider = Get.put(InspectionProvider());

  @override
  void initState() {
    super.initState();
    _tabViewController = TabController(length: 9, vsync: this);
    inspectionProvider.clearData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: 9,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Inspeção Quinzenal'),
            bottom: TabBar(
              controller: _tabViewController,
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              tabs: const [
                Tab(text: "Subestação"),
                Tab(text: "Transformador 69kV"),
                Tab(text: "Gerador de Emergência"),
                Tab(text: "Serviço Auxiliar 125VCC"),
                Tab(text: "Carregadores de Baterias"),
                Tab(text: "Tomada D'Água"),
                Tab(text: "Centrais Hidráulicas"),
                Tab(text: "Selo da Turbina"),
                Tab(text: "Finalizar"),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabViewController,
            children: const [
              V02SubstationView(),
              V03TransformerView(),
              V04EmergencyGeneratorView(),
              V05AuxiliaryServiceView(),
              V06BatteryChargersView(),
              V07WaterSupplyView(),
              V08HydraulicStationsView(),
              V09TurbineSealView(),
              V10FinalizeView()
            ],
          ),
        ),
      ),
    );
  }
}
