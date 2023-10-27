import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'history.g.dart';

@HiveType(typeId: 1)
class SearchHistory {
  @HiveField(0)
  late String? id;

  @HiveField(1)
  late String? englishword;

  @HiveField(2)
  late String? part_of_speech;

  @HiveField(3)
  late String? malayalam_definition;

  SearchHistory({
    this.id,
    this.englishword,
    this.malayalam_definition,
    this.part_of_speech,
  });
}
