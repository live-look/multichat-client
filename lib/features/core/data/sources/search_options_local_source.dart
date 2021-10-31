import 'package:hive/hive.dart';

import '../../entities/search_options.dart';

class SearchOptionsLocalSource {
  static const String boxName = "search_options";
  static const String currentOptionsKey = "current_options";

  Box<SearchOptions>? _settingsBox;
  Box<SearchOptions> get _box {
    _settingsBox ??= Hive.box<SearchOptions>(boxName);
    return _settingsBox!;
  }

  SearchOptions? getCurrentOptions() {
    return _box.get(currentOptionsKey);
  }
}
