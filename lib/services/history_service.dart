import '../models/panel_data.dart';

class HistoryService {
  static final List<PanelData> _history = [];

  static void addSample(
    PanelData panelData,
  ) {
    _history.add(panelData);

    if (_history.length > 50) {
      _history.removeAt(0);
    }
  }

  static List<PanelData> getHistory() {
    return List.unmodifiable(
      _history,
    );
  }
}

