import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../services/monitoring_service.dart';
import '../widgets/phase_card.dart';
import '../widgets/power_card.dart';
import '../widgets/status_card.dart';
import 'phase_detail_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() =>
      _DashboardPageState();
}

class _DashboardPageState
    extends State<DashboardPage> {
  late Timer refreshTimer;

  @override
  void initState() {
    super.initState();

    refreshTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    refreshTimer.cancel();
    super.dispose();
  }

  String _formatTimestamp(
    DateTime timestamp,
  ) {
    final hour = timestamp.hour
        .toString()
        .padLeft(2, '0');

    final minute = timestamp.minute
        .toString()
        .padLeft(2, '0');

    final second = timestamp.second
        .toString()
        .padLeft(2, '0');

    return '$hour:$minute:$second';
  }

  @override
  Widget build(BuildContext context) {
    final panelData =
        MonitoringService
            .instance
            .currentData;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.screenPadding,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                'Electrical Panel',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Last Updated: ${_formatTimestamp(panelData.timestamp)}',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 24),

              PowerCard(
                power:
                    '${(panelData.power / 1000).toStringAsFixed(1)} kW',
              ),

              const SizedBox(height: 16),

              PhaseCard(
                phase: 'Phase R',
                voltage:
                    '${panelData.voltageR} V',
                current:
                    '${panelData.currentR} A',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const PhaseDetailPage(
                        phaseName: 'R',
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              PhaseCard(
                phase: 'Phase S',
                voltage:
                    '${panelData.voltageS} V',
                current:
                    '${panelData.currentS} A',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const PhaseDetailPage(
                        phaseName: 'S',
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              PhaseCard(
                phase: 'Phase T',
                voltage:
                    '${panelData.voltageT} V',
                current:
                    '${panelData.currentT} A',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const PhaseDetailPage(
                        phaseName: 'T',
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              const StatusCard(
                status: 'Normal',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

