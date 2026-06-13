import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../services/history_service.dart';

class PhaseDetailPage extends StatefulWidget {
  final String phaseName;

  const PhaseDetailPage({
    super.key,
    required this.phaseName,
  });

  @override
  State<PhaseDetailPage> createState() => _PhaseDetailPageState();
}

class _PhaseDetailPageState extends State<PhaseDetailPage> {
  String selectedRange = '24H';

  // =========================
  // DATA
  // =========================
  List get _history => HistoryService.getHistory();

  List get _filtered {
    if (_history.isEmpty) return [];
    return _history.length > 50
        ? _history.sublist(_history.length - 50)
        : _history;
  }

  // =========================
  // SELECTORS
  // =========================
  double _voltage(dynamic d) {
    switch (widget.phaseName) {
      case 'R':
        return d.voltageR.toDouble();
      case 'S':
        return d.voltageS.toDouble();
      default:
        return d.voltageT.toDouble();
    }
  }

  double _current(dynamic d) {
    switch (widget.phaseName) {
      case 'R':
        return d.currentR.toDouble();
      case 'S':
        return d.currentS.toDouble();
      default:
        return d.currentT.toDouble();
    }
  }

  // =========================
  // RANGE BUFFER
  // =========================
  ({double minY, double maxY}) _calcRange(
    List<double> values,
    double buffer,
  ) {
    if (values.isEmpty) return (minY: 0, maxY: 1);

    final min = values.reduce((a, b) => a < b ? a : b);
    final max = values.reduce((a, b) => a > b ? a : b);

    return (
      minY: (min - buffer).clamp(0, double.infinity),
      maxY: max + buffer,
    );
  }

  // =========================
  // CHART MAPPER
  // =========================
  List<FlSpot> _map(double Function(dynamic d) selector) {
    return List.generate(
      _filtered.length,
      (i) => FlSpot(i.toDouble(), selector(_filtered[i])),
    );
  }

  // =========================
  // STATS CALCULATOR (NEW)
  // =========================
  double _max(List<double> v) =>
      v.isEmpty ? 0 : v.reduce((a, b) => a > b ? a : b);

  double _min(List<double> v) =>
      v.isEmpty ? 0 : v.reduce((a, b) => a < b ? a : b);

  // =========================
  // BUILD
  // =========================
  @override
  Widget build(BuildContext context) {
    final voltageValues = _filtered.map(_voltage).toList();
    final currentValues = _filtered.map(_current).toList();

    final voltageRange = _calcRange(voltageValues, 50);
    final currentRange = _calcRange(currentValues, 5);

    final voltageSpots = _map(_voltage);
    final currentSpots = _map(_current);

    // =========================
    // STATS (REAL)
    // =========================
    final maxV = _max(voltageValues);
    final minV = _min(voltageValues);
    final maxC = _max(currentValues);
    final minC = _min(currentValues);

    return Scaffold(
      appBar: AppBar(
        title: Text('Phase ${widget.phaseName}'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: '24H', label: Text('24H')),
                  ButtonSegment(value: '7D', label: Text('7D')),
                ],
                selected: {selectedRange},
                onSelectionChanged: (v) {
                  setState(() => selectedRange = v.first);
                },
              ),

              const SizedBox(height: 24),

              const Text(
                'Voltage Trend',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 8),

              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    minY: voltageRange.minY,
                    maxY: voltageRange.maxY,
                    clipData: FlClipData.all(),
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: voltageSpots,
                        isCurved: true,
                        color: AppColors.primary,
                        barWidth: 2,
                        dotData: const FlDotData(show: false),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Current Trend',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 8),

              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    minY: currentRange.minY,
                    maxY: currentRange.maxY,
                    clipData: FlClipData.all(),
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: currentSpots,
                        isCurved: true,
                        color: Colors.orangeAccent,
                        barWidth: 2,
                        dotData: const FlDotData(show: false),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // =========================
              // STATS (FINAL)
              // =========================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppSizes.smallRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Statistics',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Text('Max Voltage: ${maxV.toStringAsFixed(1)} V'),
                    Text('Min Voltage: ${minV.toStringAsFixed(1)} V'),
                    const SizedBox(height: 8),
                    Text('Max Current: ${maxC.toStringAsFixed(1)} A'),
                    Text('Min Current: ${minC.toStringAsFixed(1)} A'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

