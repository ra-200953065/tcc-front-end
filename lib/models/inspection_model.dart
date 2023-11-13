import 'package:tcc/models/user_model.dart';

class InspectionModel {
  int id;
  int userId;
  String weatherCondition;
  String ambientTemperature;
  String date;
  String time;

  // substation
  int ssTlLightningRodCountPhaseA;
  int ssTlLightningRodCountPhaseB;
  int ssTlLightningRodCountPhaseC;
  int ssTrLightningRodCountPhaseA;
  int ssTrLightningRodCountPhaseB;
  int ssTrLightningRodCountPhaseC;
  String ssDj302GasPressure;
  int ssDj302CountOperations;

  // transformer
  String trOilTemperature;
  String trCoilHvTemperature;
  String trCoilLvTemperature;
  String trOilLevel;
  String trSilicaGel;

  // Emergency Generator
  String egEngineTemperature;
  String egOilLevel;
  String egBatteryVoltage;
  String egWaterLevelRadiator;

  // Auxiliary Service
  String asBatteryRoomTemperature;
  String asBatteryRoomHumidity;
  String asQdcaConsumedEnergy;

  // Battery Chargers
  String bcCharger1InputVoltage;
  String bcCharger1InputCurrent;
  String bcCharger1OutputVoltage;
  String bcCharger1BatteryCurrent;
  String bcCharger2InputVoltage;
  String bcCharger2InputCurrent;
  String bcCharger2OutputVoltage;
  String bcCharger2BatteryCurrent;

  // Water Supply
  String wsGridAmountLevel;
  String wsGridDownstreamLevel;
  String wsWatergateDownstreamLevel;
  String wsUg1Power;
  String wsUg2Power;

  // Hydraulic Stations
  String hsUhlm1;
  String hsUhrv1;
  String hsUhlm2;
  String hsUhrv2;
  String hsCompressor1OilLevel;
  String hsCompressor2OilLevel;

  // Turbine Seal
  String tsUg1SealWaterPressure;
  String tsUg1AuxiliaryWaterPressure;
  String tsUg1SealWaterFlow;
  String tsUg2SealWaterPressure;
  String tsUg2AuxiliaryWaterPressure;
  String tsUg2SealWaterFlow;

  UserModel user;

  InspectionModel({
    required this.id,
    required this.userId,
    required this.weatherCondition,
    required this.ambientTemperature,
    required this.date,
    required this.time,

    // substation
    required this.ssTlLightningRodCountPhaseA,
    required this.ssTlLightningRodCountPhaseB,
    required this.ssTlLightningRodCountPhaseC,
    required this.ssTrLightningRodCountPhaseA,
    required this.ssTrLightningRodCountPhaseB,
    required this.ssTrLightningRodCountPhaseC,
    required this.ssDj302GasPressure,
    required this.ssDj302CountOperations,

    // transformer
    required this.trOilTemperature,
    required this.trCoilHvTemperature,
    required this.trCoilLvTemperature,
    required this.trOilLevel,
    required this.trSilicaGel,

    // Emergency Generator
    required this.egEngineTemperature,
    required this.egOilLevel,
    required this.egBatteryVoltage,
    required this.egWaterLevelRadiator,

    // Auxiliary Service
    required this.asBatteryRoomTemperature,
    required this.asBatteryRoomHumidity,
    required this.asQdcaConsumedEnergy,

    // Battery Chargers
    required this.bcCharger1InputVoltage,
    required this.bcCharger1InputCurrent,
    required this.bcCharger1OutputVoltage,
    required this.bcCharger1BatteryCurrent,
    required this.bcCharger2InputVoltage,
    required this.bcCharger2InputCurrent,
    required this.bcCharger2OutputVoltage,
    required this.bcCharger2BatteryCurrent,

    // Water Supply
    required this.wsGridAmountLevel,
    required this.wsGridDownstreamLevel,
    required this.wsWatergateDownstreamLevel,
    required this.wsUg1Power,
    required this.wsUg2Power,

    // Hydraulic Stations
    required this.hsUhlm1,
    required this.hsUhrv1,
    required this.hsUhlm2,
    required this.hsUhrv2,
    required this.hsCompressor1OilLevel,
    required this.hsCompressor2OilLevel,

    // Turbine Seal
    required this.tsUg1SealWaterPressure,
    required this.tsUg1AuxiliaryWaterPressure,
    required this.tsUg1SealWaterFlow,
    required this.tsUg2SealWaterPressure,
    required this.tsUg2AuxiliaryWaterPressure,
    required this.tsUg2SealWaterFlow,
    required this.user,
  });

  factory InspectionModel.fromJson(Map<String, dynamic> item) {
    return InspectionModel(
      id: item['id'],
      userId: item['user_id'],
      weatherCondition: item['weather_condition'],
      ambientTemperature: item['ambient_temperature'],
      date: item['date'],
      time: item['time'],

      // substation
      ssTlLightningRodCountPhaseA: item['ss_tl_lightning_rod_count_phase_a'],
      ssTlLightningRodCountPhaseB: item['ss_tl_lightning_rod_count_phase_b'],
      ssTlLightningRodCountPhaseC: item['ss_tl_lightning_rod_count_phase_c'],
      ssTrLightningRodCountPhaseA: item['ss_tr_lightning_rod_count_phase_a'],
      ssTrLightningRodCountPhaseB: item['ss_tr_lightning_rod_count_phase_b'],
      ssTrLightningRodCountPhaseC: item['ss_tr_lightning_rod_count_phase_c'],
      ssDj302GasPressure: item['ss_dj302_gas_pressure'],
      ssDj302CountOperations: item['ss_dj302_count_operations'],

      // transformer
      trOilTemperature: item['tr_oil_temperature'],
      trCoilHvTemperature: item['tr_coil_hv_temperature'],
      trCoilLvTemperature: item['tr_coil_lv_temperature'],
      trOilLevel: item['tr_oil_level'],
      trSilicaGel: item['tr_silica_gel'],

      // Emergency Generator
      egEngineTemperature: item['eg_engine_temperature'],
      egOilLevel: item['eg_oil_level'],
      egBatteryVoltage: item['eg_battery_voltage'],
      egWaterLevelRadiator: item['eg_water_level_radiator'],

      // Auxiliary Service
      asBatteryRoomTemperature: item['as_battery_room_temperature'],
      asBatteryRoomHumidity: item['as_battery_room_humidity'],
      asQdcaConsumedEnergy: item['as_qdca_consumed_energy'],

      // Battery Chargers
      bcCharger1InputVoltage: item['bc_charger_1_input_voltage'],
      bcCharger1InputCurrent: item['bc_charger_1_input_current'],
      bcCharger1OutputVoltage: item['bc_charger_1_output_voltage'],
      bcCharger1BatteryCurrent: item['bc_charger_1_battery_current'],
      bcCharger2InputVoltage: item['bc_charger_2_input_voltage'],
      bcCharger2InputCurrent: item['bc_charger_2_input_current'],
      bcCharger2OutputVoltage: item['bc_charger_2_output_voltage'],
      bcCharger2BatteryCurrent: item['bc_charger_2_battery_current'],

      // Water Supply
      wsGridAmountLevel: item['ws_grid_amount_level'],
      wsGridDownstreamLevel: item['ws_grid_downstream_level'],
      wsWatergateDownstreamLevel: item['ws_watergate_downstream_level'],
      wsUg1Power: item['ws_ug_1_power'],
      wsUg2Power: item['ws_ug_2_power'],

      // Hydraulic Stations
      hsUhlm1: item['hs_uhlm_1'],
      hsUhrv1: item['hs_uhrv_1'],
      hsUhlm2: item['hs_uhlm_2'],
      hsUhrv2: item['hs_uhrv_2'],
      hsCompressor1OilLevel: item['hs_compressor_1_oil_level'],
      hsCompressor2OilLevel: item['hs_compressor_2_oil_level'],

      // Turbine Seal
      tsUg1SealWaterPressure: item['ts_ug_1_seal_water_pressure'],
      tsUg1AuxiliaryWaterPressure: item['ts_ug_1_auxiliary_water_pressure'],
      tsUg1SealWaterFlow: item['ts_ug_1_seal_water_flow'],
      tsUg2SealWaterPressure: item['ts_ug_2_seal_water_pressure'],
      tsUg2AuxiliaryWaterPressure: item['ts_ug_2_auxiliary_water_pressure'],
      tsUg2SealWaterFlow: item['ts_ug_2_seal_water_flow'],

      user: UserModel.fromJson(item['user']),
    );
  }
}
