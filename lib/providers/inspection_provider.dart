import 'package:get/get.dart';

class InspectionProvider extends GetxController {
  String tlLightningRodCounterPhaseA = '';
  String tlLightningRodCounterPhaseB = '';
  String tlLightningRodCounterPhaseC = '';
  String trLightningRodCounterPhaseA = '';
  String trLightningRodCounterPhaseB = '';
  String trLightningRodCounterPhaseC = '';
  String dj302GasPressure = '';
  String dj302CounterOperations = '';

  String trOilTemperature = '';
  String trCoilHVTemperature = '';
  String trCoilLVTemperature = '';
  String? trOilLevel;
  String? trSilicaGel;

  String egEngineTemperature = '';
  String? egOilLevel;
  String egBatteryVoltage = '';
  String? egWaterLevelRadiator;

  String asBatteryRoomTemperature = '';
  String asBatteryRoomHumidity = '';
  String asQDCAConsumedEnergy = '';

  String bcCharger1InputVoltage = '';
  String bcCharger1InputCurrent = '';
  String bcCharger1OutputVoltage = '';
  String bcCharger1BatteryCurrent = '';
  String bcCharger2InputVoltage = '';
  String bcCharger2InputCurrent = '';
  String bcCharger2OutputVoltage = '';
  String bcCharger2BatteryCurrent = '';

  String wsGridAmountLevel = '';
  String wsGridDownstreamLevel = '';
  String wsWatergateDownstreamLevel = '';
  String wsUG1Power = '';
  String wsUG2Power = '';

  String? hsUHLM1;
  String? hsUHRV1;
  String? hsUHLM2;
  String? hsUHRV2;
  String? hsCompressor1OilLevel;
  String? hsCompressor2OilLevel;

  String tsUG1SealWaterPressure = '';
  String tsUG1AuxiliaryWaterPressure = '';
  String tsUG1SealWaterFlow = '';
  String tsUG2SealWaterPressure = '';
  String tsUG2AuxiliaryWaterPressure = '';
  String tsUG2SealWaterFlow = '';

  String? weatherCondition;
  String ambientTemperature = '';

  Map<String, dynamic> getData(int userId) {
    return {
      'user_id': userId,
      'weather_condition': weatherCondition,
      'ambient_temperature': ambientTemperature,
      'date': _getCurrentDate(),
      'time': _getCurrentTime(),
      'ss_tl_lightning_rod_count_phase_a': tlLightningRodCounterPhaseA,
      'ss_tl_lightning_rod_count_phase_b': tlLightningRodCounterPhaseB,
      'ss_tl_lightning_rod_count_phase_c': tlLightningRodCounterPhaseC,
      'ss_tr_lightning_rod_count_phase_a': trLightningRodCounterPhaseA,
      'ss_tr_lightning_rod_count_phase_b': trLightningRodCounterPhaseB,
      'ss_tr_lightning_rod_count_phase_c': trLightningRodCounterPhaseC,
      'ss_dj302_gas_pressure': dj302GasPressure,
      'ss_dj302_count_operations': dj302CounterOperations,
      'tr_oil_temperature': trOilTemperature,
      'tr_coil_hv_temperature': trCoilHVTemperature,
      'tr_coil_lv_temperature': trCoilLVTemperature,
      'tr_oil_level': trOilLevel,
      'tr_silica_gel': trSilicaGel,
      'eg_engine_temperature': egEngineTemperature,
      'eg_oil_level': egOilLevel,
      'eg_battery_voltage': egBatteryVoltage,
      'eg_water_level_radiator': egWaterLevelRadiator,
      'as_battery_room_temperature': asBatteryRoomTemperature,
      'as_battery_room_humidity': asBatteryRoomHumidity,
      'as_qdca_consumed_energy': asQDCAConsumedEnergy,
      'bc_charger_1_input_voltage': bcCharger1InputVoltage,
      'bc_charger_1_input_current': bcCharger1InputCurrent,
      'bc_charger_1_output_voltage': bcCharger1OutputVoltage,
      'bc_charger_1_battery_current': bcCharger1BatteryCurrent,
      'bc_charger_2_input_voltage': bcCharger2InputVoltage,
      'bc_charger_2_input_current': bcCharger2InputCurrent,
      'bc_charger_2_output_voltage': bcCharger2OutputVoltage,
      'bc_charger_2_battery_current': bcCharger2BatteryCurrent,
      'ws_grid_amount_level': wsGridAmountLevel,
      'ws_grid_downstream_level': wsGridDownstreamLevel,
      'ws_watergate_downstream_level': wsWatergateDownstreamLevel,
      'ws_ug_1_power': wsUG1Power,
      'ws_ug_2_power': wsUG2Power,
      'hs_uhlm_1': hsUHLM1,
      'hs_uhrv_1': hsUHRV1,
      'hs_uhlm_2': hsUHLM2,
      'hs_uhrv_2': hsUHRV2,
      'hs_compressor_1_oil_level': hsCompressor1OilLevel,
      'hs_compressor_2_oil_level': hsCompressor2OilLevel,
      'ts_ug_1_seal_water_pressure': tsUG1SealWaterPressure,
      'ts_ug_1_auxiliary_water_pressure': tsUG1AuxiliaryWaterPressure,
      'ts_ug_1_seal_water_flow': tsUG1SealWaterFlow,
      'ts_ug_2_seal_water_pressure': tsUG2SealWaterPressure,
      'ts_ug_2_auxiliary_water_pressure': tsUG2AuxiliaryWaterPressure,
      'ts_ug_2_seal_water_flow': tsUG2SealWaterFlow,
    };
  }

  bool isDataValid() {
    if (tlLightningRodCounterPhaseA == '') {
      return false;
    }
    if (tlLightningRodCounterPhaseB == '') {
      return false;
    }
    if (tlLightningRodCounterPhaseC == '') {
      return false;
    }
    if (trLightningRodCounterPhaseA == '') {
      return false;
    }
    if (trLightningRodCounterPhaseB == '') {
      return false;
    }
    if (trLightningRodCounterPhaseC == '') {
      return false;
    }
    if (dj302GasPressure == '') {
      return false;
    }
    if (dj302CounterOperations == '') {
      return false;
    }
    if (trOilTemperature == '') {
      return false;
    }
    if (trCoilHVTemperature == '') {
      return false;
    }
    if (trCoilLVTemperature == '') {
      return false;
    }
    if (trOilLevel == null || trOilLevel == '') {
      return false;
    }
    if (trSilicaGel == null || trSilicaGel == '') {
      return false;
    }
    if (egEngineTemperature == '') {
      return false;
    }
    if (egOilLevel == null || egOilLevel == '') {
      return false;
    }
    if (egBatteryVoltage == '') {
      return false;
    }
    if (egWaterLevelRadiator == null || egWaterLevelRadiator == '') {
      return false;
    }
    if (asBatteryRoomTemperature == '') {
      return false;
    }
    if (asBatteryRoomHumidity == '') {
      return false;
    }
    if (asQDCAConsumedEnergy == '') {
      return false;
    }
    if (bcCharger1InputVoltage == '') {
      return false;
    }
    if (bcCharger1InputCurrent == '') {
      return false;
    }
    if (bcCharger1OutputVoltage == '') {
      return false;
    }
    if (bcCharger1BatteryCurrent == '') {
      return false;
    }
    if (bcCharger2InputVoltage == '') {
      return false;
    }
    if (bcCharger2InputCurrent == '') {
      return false;
    }
    if (bcCharger2OutputVoltage == '') {
      return false;
    }
    if (bcCharger2BatteryCurrent == '') {
      return false;
    }
    if (wsGridAmountLevel == '') {
      return false;
    }
    if (wsGridDownstreamLevel == '') {
      return false;
    }
    if (wsWatergateDownstreamLevel == '') {
      return false;
    }
    if (wsUG1Power == '') {
      return false;
    }
    if (wsUG2Power == '') {
      return false;
    }
    if (hsUHLM1 == null || hsUHLM1 == '') {
      return false;
    }
    if (hsUHRV1 == null || hsUHRV1 == '') {
      return false;
    }
    if (hsUHLM2 == null || hsUHLM2 == '') {
      return false;
    }
    if (hsUHRV2 == null || hsUHRV2 == '') {
      return false;
    }
    if (hsCompressor1OilLevel == null || hsCompressor1OilLevel == '') {
      return false;
    }
    if (hsCompressor2OilLevel == null || hsCompressor2OilLevel == '') {
      return false;
    }
    if (tsUG1SealWaterPressure == '') {
      return false;
    }
    if (tsUG1AuxiliaryWaterPressure == '') {
      return false;
    }
    if (tsUG1SealWaterFlow == '') {
      return false;
    }
    if (tsUG2SealWaterPressure == '') {
      return false;
    }
    if (tsUG2AuxiliaryWaterPressure == '') {
      return false;
    }
    if (tsUG2SealWaterFlow == '') {
      return false;
    }
    if (weatherCondition == null || weatherCondition == '') {
      return false;
    }
    if (ambientTemperature == '') {
      return false;
    }

    return true;
  }

  void clearData() {
    tlLightningRodCounterPhaseA = '';
    tlLightningRodCounterPhaseB = '';
    tlLightningRodCounterPhaseC = '';
    trLightningRodCounterPhaseA = '';
    trLightningRodCounterPhaseB = '';
    trLightningRodCounterPhaseC = '';
    dj302GasPressure = '';
    dj302CounterOperations = '';
    trOilTemperature = '';
    trCoilHVTemperature = '';
    trCoilLVTemperature = '';
    trOilLevel = null;
    trSilicaGel = null;
    egEngineTemperature = '';
    egOilLevel = null;
    egBatteryVoltage = '';
    egWaterLevelRadiator = null;
    asBatteryRoomTemperature = '';
    asBatteryRoomHumidity = '';
    asQDCAConsumedEnergy = '';
    bcCharger1InputVoltage = '';
    bcCharger1InputCurrent = '';
    bcCharger1OutputVoltage = '';
    bcCharger1BatteryCurrent = '';
    bcCharger2InputVoltage = '';
    bcCharger2InputCurrent = '';
    bcCharger2OutputVoltage = '';
    bcCharger2BatteryCurrent = '';
    wsGridAmountLevel = '';
    wsGridDownstreamLevel = '';
    wsWatergateDownstreamLevel = '';
    wsUG1Power = '';
    wsUG2Power = '';
    hsUHLM1 = null;
    hsUHRV1 = null;
    hsUHLM2 = null;
    hsUHRV2 = null;
    hsCompressor1OilLevel = null;
    hsCompressor2OilLevel = null;
    tsUG1SealWaterPressure = '';
    tsUG1AuxiliaryWaterPressure = '';
    tsUG1SealWaterFlow = '';
    tsUG2SealWaterPressure = '';
    tsUG2AuxiliaryWaterPressure = '';
    tsUG2SealWaterFlow = '';
    weatherCondition = null;
    ambientTemperature = '';
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();

    String day = now.day < 10 ? '0${now.day}' : '${now.day}';
    String month = now.month < 10 ? '0${now.month}' : '${now.month}';

    return '${now.year}-$month-$day';
  }

  String _getCurrentTime() {
    DateTime now = DateTime.now();

    String hour = now.hour < 10 ? '0${now.hour}' : '${now.hour - 3}';
    String minute = now.minute < 10 ? '0${now.minute}' : '${now.minute}';
    String second = now.second < 10 ? '0${now.second}' : '${now.second}';

    return '$hour:$minute:$second';
  }
}
