
import 'package:dictionary_app_1/models/search/hive_datamodel.dart';
import 'package:hive/hive.dart';

import 'dart:core';

Future<List<Searchword>> getSearchWord(
    String searchWord, String searchType) async {
  //create new list  for adding found values
  List<Searchword> foundItems = [];

  //Open new instance of the search box
  final Box<Searchword> dictionaryBox =
      Hive.box<Searchword>("myDataBox");
  RegExp regExpStart = RegExp(
    '^$searchWord',
    caseSensitive: false,
  );
  RegExp regExpEndWith = RegExp(
    '$searchWord\$',
    caseSensitive: false,
  );

  //convert the box values into list
  List<Searchword> meaningWord = dictionaryBox.values.toList();

  switch (searchType) {
    case 'start':
      // int idx1 = 0;
      // while (idx1 < meaningWord.length) {
      //   int _counter = 0;
      //   if (regExpStart.hasMatch(meaningWord[idx1].englishWword) &&
      //       _counter <= 25) {
      //     // if the element is found add to the list that we created
      //     foundItems.add(meaningWord[idx1]);
      //     _counter++;
      //   }
      // }
      foundItems = meaningWord
          .where((word) => regExpStart.hasMatch(word.englishword!))
          .toList();


    case "contains":
      int idx = 0;
      while (idx < meaningWord.length) {
        if (meaningWord[idx].englishword!.contains(searchWord)) {
          foundItems.add(meaningWord[idx]);
        }

        idx++;
      }
      print(searchType);
    case "endwith":
      int idx = 0;
      while (idx < meaningWord.length && searchType.toString() != '') {
        if (regExpEndWith.hasMatch(meaningWord[idx].englishword!)) {
          foundItems.add(meaningWord[idx]);
        }

        idx++;
      }

      print(searchType);
  }

  return foundItems;
}