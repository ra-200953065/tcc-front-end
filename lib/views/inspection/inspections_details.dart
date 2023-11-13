import 'package:flutter/material.dart';
import 'package:tcc/models/inspection_model.dart';

class InspectionsDetails extends StatelessWidget {
  const InspectionsDetails({
    super.key,
    required this.item,
  });

  final InspectionModel item;

  @override
  Widget build(BuildContext context) {
    Widget title(String title) {
      return Column(
        children: [
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
        ],
      );
    }

    Widget itemRow(String label, dynamic data, String unit) {
      String x = data.toString().replaceAll('.', ',');

      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(label),
            ),
            Text('$x $unit', textAlign: TextAlign.end)
          ],
        ),
      );
    }

    String dateIsoToPtbr(String isoDate) {
      final splitted = isoDate.split('-');

      return '${splitted[2]}/${splitted[1]}/${splitted[0]}';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Inspeção'),
        actions: [
          IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/home",
                  (r) => false,
                );
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title('Dados Gerais'),
              itemRow('Responsável:', item.user.name, ''),
              itemRow('Data:', dateIsoToPtbr(item.date), ''),
              itemRow('Hora:', item.time, ''),
              itemRow('Temperatura ambiente:', item.ambientTemperature, '°C'),
              itemRow('Condições do Tempo:', item.weatherCondition, ''),
              title('Subestação'),
              itemRow(
                'Diparos do Para-raios da Fase A da LT-BNE:',
                item.ssTlLightningRodCountPhaseA,
                '',
              ),
              itemRow(
                'Diparos do Para-raios da Fase B da LT-BNE:',
                item.ssTlLightningRodCountPhaseB,
                '',
              ),
              itemRow(
                'Diparos do Para-raios da Fase C da LT-BNE:',
                item.ssTlLightningRodCountPhaseC,
                '',
              ),
              itemRow(
                'Diparos do Para-raios da Fase A do TF1:',
                item.ssTrLightningRodCountPhaseA,
                '',
              ),
              itemRow(
                'Diparos do Para-raios da Fase B do TF1:',
                item.ssTrLightningRodCountPhaseB,
                '',
              ),
              itemRow(
                'Diparos do Para-raios da Fase C do TF1:',
                item.ssTrLightningRodCountPhaseC,
                '',
              ),
              itemRow(
                'Pressão do Gás SFC do Disjuntor 302:',
                item.ssDj302GasPressure,
                'bar',
              ),
              itemRow(
                'Número de Operações do Disjuntor 302:',
                item.ssDj302GasPressure,
                '',
              ),
              title('Transformador 69kV'),
              itemRow('Temperatura do Óleo:', item.trOilTemperature, '°C'),
              itemRow(
                'Temperatura do Enrolamento AT:',
                item.trCoilHvTemperature,
                '°C',
              ),
              itemRow(
                'Temperatura do Enrolamento BT:',
                item.trCoilLvTemperature,
                '°C',
              ),
              itemRow('Nível do Óleo:', item.trOilLevel, ''),
              itemRow('Sílica Gel:', item.trSilicaGel, ''),
              title('Gerador de Emergência'),
              itemRow('Temperatura do Motor:', item.egEngineTemperature, '°C'),
              itemRow('Nível do Óleo:', item.egOilLevel, ''),
              itemRow('Tensão da bateria:', item.egBatteryVoltage, 'V'),
              itemRow(
                'Nível de Águna no Radiador:',
                item.egWaterLevelRadiator,
                '',
              ),
              title('Serviço Auxiliar 125VCC'),
              itemRow(
                'Temperatura na Sala de Baterias:',
                item.asBatteryRoomTemperature,
                '°C',
              ),
              itemRow(
                'Umidade do Ar na Sala de Baterias:',
                item.asBatteryRoomHumidity,
                '%',
              ),
              itemRow(
                'Energia Consumida no QDCA:',
                item.asQdcaConsumedEnergy,
                'kWh',
              ),
              title('Carregadores de Baterias'),
              itemRow(
                'Tensão de Entrada do Carregador 1:',
                item.bcCharger1InputVoltage,
                'V',
              ),
              itemRow(
                'Corrente de Entrada do Carregador 1:',
                item.bcCharger1InputCurrent,
                'A',
              ),
              itemRow(
                'Tensão de Saída do Carregador 1:',
                item.bcCharger1OutputVoltage,
                'V',
              ),
              itemRow(
                'Corrente da Bateria do Carregador 1:',
                item.bcCharger1BatteryCurrent,
                'A',
              ),
              itemRow(
                'Tensão de Entrada do Carregador 2:',
                item.bcCharger2InputVoltage,
                'V',
              ),
              itemRow(
                'Corrente de Entrada do Carregador 2:',
                item.bcCharger2InputCurrent,
                'A',
              ),
              itemRow(
                'Tensão de Saída do Carregador 2:',
                item.bcCharger2OutputVoltage,
                'V',
              ),
              itemRow(
                'Corrente da Bateria do Carregador 2:',
                item.bcCharger2BatteryCurrent,
                'A',
              ),
              title('Tomada D\'Água'),
              itemRow('Nível Montante à Grade:', item.wsGridAmountLevel, 'm'),
              itemRow(
                  'Nível Jusante à Grade:', item.wsGridDownstreamLevel, 'm'),
              itemRow('Nível Jusante à Comporta:',
                  item.wsWatergateDownstreamLevel, 'm'),
              itemRow('Potência da UGG01:', item.wsUg1Power, 'MW'),
              itemRow('Potência da UGG02:', item.wsUg2Power, 'MW'),
              title('Centrais Hidráulicas'),
              itemRow('UHLM 1:', item.hsUhlm1, ''),
              itemRow('UHRV 1:', item.hsUhrv1, ''),
              itemRow('UHLM 2:', item.hsUhlm2, ''),
              itemRow('UHRV 2:', item.hsUhrv2, ''),
              itemRow('Nível de Óleo do Compressor 1:',
                  item.hsCompressor1OilLevel, ''),
              itemRow('Nível de Óleo do Compressor 2:',
                  item.hsCompressor2OilLevel, ''),
              title('Selo da Turbina'),
              itemRow('Pressão de Água no Selo da UGG01:',
                  item.tsUg1SealWaterPressure, 'bar'),
              itemRow('Pressão de Água Auxiliar da UGG01:',
                  item.tsUg1AuxiliaryWaterPressure, 'bar'),
              itemRow('Fluxo de Água no Selo da UGG01:',
                  item.tsUg1SealWaterFlow, 'lpm'),
              itemRow('Pressão de Água no Selo da UGG02:',
                  item.tsUg2SealWaterPressure, 'bar'),
              itemRow('Pressão de Água Auxiliar da UGG02:',
                  item.tsUg2AuxiliaryWaterPressure, 'bar'),
              itemRow('Fluxo de Água no Selo da UGG02:',
                  item.tsUg2SealWaterFlow, 'lpm'),
            ],
          ),
        ),
      ),
    );
  }
}
