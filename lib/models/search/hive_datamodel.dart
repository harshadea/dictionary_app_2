import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hive_datamodel.g.dart';

@HiveType(typeId: 0)
class Searchword {
  @HiveField(0)
  late String? id;

  @HiveField(1)
  late String? englishword;

  @HiveField(2)
  late String? part_of_speech;

  @HiveField(3)
  late String? malayalam_definition;

  Searchword({
    this.id,
    this.englishword,
    this.malayalam_definition,
    this.part_of_speech,
  });
}
