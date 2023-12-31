import 'package:csv/csv.dart';
import 'package:dictionary_app_1/models/search/hive_datamodel.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

Future<void> loadData() async {
  // Define the path to the CSV file
  final String csvPath = "assets/images/dictionary.csv";

  // Load the CSV file from the assets
  final myData = await rootBundle.load(csvPath);

  // Decode the CSV data
  String content = utf8.decode(myData.buffer.asUint8List());

  // Create a new instance of the created box
  late Box<Searchword> dictionaryBox = Hive.box<Searchword>("myDataBox");

  // Convert the CSV data into a list using the csv package
  List<List<dynamic>> fields = const CsvToListConverter().convert(content);

// Iterate through the list

  for (int element = 0; element < fields.length; element++) {
    final word = Searchword(
      englishword: fields[element][1].toString().toLowerCase(),
      id: fields[element][0].toString().toLowerCase(),
      part_of_speech: fields[element][2].toString().toLowerCase(),
      malayalam_definition: fields[element][3].toString().toLowerCase(),
    );
    dictionaryBox.add(word);

    // }
    // fields.forEach((element) {
    //   final word = SearchWordModel(
    //     englishWword: element[1].toString(),
    //     key: element[0].toString(),
    //     wordType: element[2].toString(),
    //     malayalamWord: element[3].toString(),
    //   );
    //   dictionaryBox.add(word);

    // print("datalodaer function is called");
    Future.delayed(const Duration(seconds: 5));
  }
  var res = dictionaryBox.values.toList();
  print(res.length);
  // List<Searchword> dictionarylist = dictionaryBox.values.toList();
  // print(dictionarylist.length);
}
