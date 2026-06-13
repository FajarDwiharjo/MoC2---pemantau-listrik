import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../models/panel_data.dart';
import '../services/history_service.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  String selectedMetric = 'Power';

  List<PanelData> get history => HistoryService.getHistory();

  List<PanelData> get filteredHistory {
    if (history.isEmpty) return [];
    return history.length > 50
        ? history.sublist(history.length - 50)
        : history;
  }

  // =========================
  // MAPPER
  // =========================
  List<FlSpot> _map(double Function(PanelData d) selector) {
    return List.generate(filteredHistory.length, (i) {
      return FlSpot(i.toDouble(), selector(filteredHistory[i]));
    });
  }

  // =========================
  // BUFFER CALC (SAME IDEA AS PHASE)
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
  // VALUES
  // =========================
  List<double> _values() {
    if (selectedMetric == 'Power') {
      return filteredHistory.map((e) => e.power / 1000).toList();
    }

    if (selectedMetric == 'Voltage') {
      return filteredHistory.map((e) => e.voltageR.toDouble()).toList();
    }

    return filteredHistory.map((e) => e.currentR.toDouble()).toList();
  }

  // =========================
  // UI
  // =========================
  @override
  Widget build(BuildContext context) {
    final values = _values();

    // 🔥 BUFFER RULES
    final range = selectedMetric == 'Voltage'
        ? _calcRange(values, 50) // voltage buffer
        : selectedMetric == 'Current'
            ? _calcRange(values, 5) // current buffer
            : _calcRange(values, 0.5); // power buffer (kW)

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Analytics',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 24),

              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'Power', label: Text('Power')),
                  ButtonSegment(value: 'Voltage', label: Text('Voltage')),
                  ButtonSegment(value: 'Current', label: Text('Current')),
                ],
                selected: {selectedMetric},
                onSelectionChanged: (v) {
                  setState(() => selectedMetric = v.first);
                },
              ),

              const SizedBox(height: 24),

              // =========================
              // CHART
              // =========================
              Container(
                height: 250,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppSizes.largeRadius),
                ),
                child: LineChart(
                  LineChartData(
                    minY: range.minY,
                    maxY: range.maxY,

                    clipData: FlClipData.all(),
                    gridData: const FlGridData(show: true),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),

                    lineBarsData: selectedMetric == 'Power'
                        ? [
                            LineChartBarData(
                              spots: _map((d) => d.power / 1000),
                              color: AppColors.primary,
                              barWidth: 2.5,
                              isCurved: true,
                              dotData: const FlDotData(show: false),
                            )
                          ]
                        : selectedMetric == 'Voltage'
                            ? [
                                LineChartBarData(
                                  spots: _map((d) => d.voltageR.toDouble()),
                                  color: Colors.redAccent,
                                  isCurved: true,
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: _map((d) => d.voltageS.toDouble()),
                                  color: Colors.greenAccent,
                                  isCurved: true,
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: _map((d) => d.voltageT.toDouble()),
                                  color: Colors.blueAccent,
                                  isCurved: true,
                                  dotData: const FlDotData(show: false),
                                ),
                              ]
                            : [
                                LineChartBarData(
                                  spots: _map((d) => d.currentR.toDouble()),
                                  color: Colors.redAccent,
                                  isCurved: true,
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: _map((d) => d.currentS.toDouble()),
                                  color: Colors.greenAccent,
                                  isCurved: true,
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: _map((d) => d.currentT.toDouble()),
                                  color: Colors.blueAccent,
                                  isCurved: true,
                                  dotData: const FlDotData(show: false),
                                ),
                              ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // =========================
              // STATS
              // =========================
              Container(
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),

                    Text('Max: ${values.isEmpty ? 0 : values.reduce((a, b) => a > b ? a : b).toStringAsFixed(2)}'),
                    Text('Min: ${values.isEmpty ? 0 : values.reduce((a, b) => a < b ? a : b).toStringAsFixed(2)}'),
                    Text('Avg: ${values.isEmpty ? 0 : (values.reduce((a, b) => a + b) / values.length).toStringAsFixed(2)}'),
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
