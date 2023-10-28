
import 'package:dictionary_app_1/models/search/hive_datamodel.dart';
import 'package:hive/hive.dart';

import 'dart:core';

Future<List<Searchword>> getSearchWordMalayalam(
    String searchWordMalayalam, String malayalamSearchType) async {
  //create new list  for adding found values
  List<Searchword> foundItemsMalayalamList = [];

  //Open new instance of the search box
  final Box<Searchword> dictionaryBox =
      Hive.box<Searchword>("myDataBox");
  RegExp regExpStart = RegExp(
    '^$searchWordMalayalam',
    caseSensitive: false,
  );
  RegExp regExpEndWith = RegExp(
    '$searchWordMalayalam\$',
    caseSensitive: false,
  );

  //convert the box values into list
  List<Searchword> meaningWord = dictionaryBox.values.toList();

  switch (malayalamSearchType) {
    case 'start':
      foundItemsMalayalamList = meaningWord
          .where((word) => regExpStart.hasMatch(word.malayalam_definition!))
          .toList();

    case "contains":
      int idx = 0;
      while (idx < meaningWord.length) {
        if (meaningWord[idx].malayalam_definition!.contains(searchWordMalayalam)) {
          foundItemsMalayalamList.add(meaningWord[idx]);
        }

        idx++;
      }
      print(malayalamSearchType);
    case "endwith":
      int idx = 0;
      while (idx < meaningWord.length && malayalamSearchType.toString() != '') {
        if (regExpEndWith.hasMatch(meaningWord[idx].malayalam_definition!)) {
          foundItemsMalayalamList.add(meaningWord[idx]);
        }

        idx++;
      }
  }

  return foundItemsMalayalamList;
}