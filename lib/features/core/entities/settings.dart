import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 2)
class Settings extends Equatable {
  @HiveField(0)
  final bool soundEnabled;
  @HiveField(1)
  final bool vibrateEnabled;

  const Settings({
    required this.soundEnabled,
    required this.vibrateEnabled,
  });

  @override
  List<Object> get props => [soundEnabled, vibrateEnabled];
}
