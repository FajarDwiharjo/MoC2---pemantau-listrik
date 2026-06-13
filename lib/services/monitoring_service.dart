import 'dart:async';

import '../data/dummy_panel_data.dart';
import '../models/panel_data.dart';
import 'history_service.dart';

class MonitoringService {
  MonitoringService._();

  static final MonitoringService instance =
      MonitoringService._();

  Timer? _timer;

  PanelData currentData =
      DummyPanelData.generate();

  void start() {
    if (_timer != null) {
      return;
    }

    HistoryService.addSample(
      currentData,
    );

    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        currentData =
            DummyPanelData.generate();

        HistoryService.addSample(
          currentData,
        );
      },
    );
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }
}

