import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'search_options.g.dart';

@HiveType(typeId: 3)
class SearchOptions extends Equatable {
  @HiveField(0)
  final int age;
  @HiveField(1)
  final String gender;

  const SearchOptions({required this.age, required this.gender});

  @override
  List<Object> get props => [age, gender];
}
