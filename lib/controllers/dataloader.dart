import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

List<List<dynamic>> _loadCSV()  {
  final _rawData =  rootBundle.loadString("");
  List<List<dynamic>> _listData = const CsvToListConverter().convert(_rawData.toString());
  print(_listData);
  return _listData;
}
