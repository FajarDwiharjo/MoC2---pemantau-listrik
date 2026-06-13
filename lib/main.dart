import 'package:flutter/material.dart';

import 'constants/app_colors.dart';
import 'pages/login_page.dart';
import 'services/monitoring_service.dart';

void main() {
  MonitoringService.instance.start();

  runApp(
    const PanelMonitorApp(),
  );
}

class PanelMonitorApp extends StatelessWidget {
  const PanelMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Panel Monitor',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:
            AppColors.background,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          surface: AppColors.card,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
