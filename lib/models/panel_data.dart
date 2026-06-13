class PanelData {
  final int voltageR;
  final int voltageS;
  final int voltageT;

  final int currentR;
  final int currentS;
  final int currentT;

  final double power;

  final DateTime timestamp;

  const PanelData({
    required this.voltageR,
    required this.voltageS,
    required this.voltageT,
    required this.currentR,
    required this.currentS,
    required this.currentT,
    required this.power,
    required this.timestamp,
  });
}

