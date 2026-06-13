import 'dart:math';

import '../models/panel_data.dart';

class DummyPanelData {
  static final Random _random = Random();

  static PanelData generate() {
    final voltageR = 227 + _random.nextInt(4);
    final voltageS = 227 + _random.nextInt(4);
    final voltageT = 227 + _random.nextInt(4);

    final currentR = 11 + _random.nextInt(4);
    final currentS = 11 + _random.nextInt(4);
    final currentT = 11 + _random.nextInt(4);

    final averageVoltage =
        (voltageR + voltageS + voltageT) / 3;

    final averageCurrent =
        (currentR + currentS + currentT) / 3;

    const powerFactor = 0.9;

    final power =
        1.732 *
        averageVoltage *
        averageCurrent *
        powerFactor;

    return PanelData(
      voltageR: voltageR,
      voltageS: voltageS,
      voltageT: voltageT,
      currentR: currentR,
      currentS: currentS,
      currentT: currentT,
      power: power,
      timestamp: DateTime.now(),
    );
  }
}