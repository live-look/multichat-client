import 'package:hive/hive.dart';

import '../../entities/settings.dart';

class SettingsLocalSource {
  static const String boxName = "settings";
  static const String currentSettingsKey = "current_settings";

  Box<Settings>? _settingsBox;
  Box<Settings> get _box {
    _settingsBox ??= Hive.box<Settings>(boxName);
    return _settingsBox!;
  }

  Settings? getCurrentSettings() {
    return _box.get(currentSettingsKey);
  }
}
