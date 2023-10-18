import 'package:flutter/material.dart';

class SearchWay extends StatefulWidget {
  const SearchWay({super.key});

  @override
  State<SearchWay> createState() => _SearchWayState();
}

class _SearchWayState extends State<SearchWay> {


  Map<String, String> dictionary = {
    'apple': 'ആപ്പിൾ',
    'banana': 'പഴം',
    // Add more words and translations
  };

  void performSearch() {
    setState(() {
      if (dictionary.containsKey(searchQuery)) {
        searchResult = dictionary[searchQuery]!;
      } else {
        searchResult = 'Word not found in the dictionary';
      }
    });
  }

  String searchQuery = '';
  String searchResult = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
          decoration: const InputDecoration(
              hintText: ' Type English Word',
              hintStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        // Text(
        //   'Result: $searchResult',
        //   style: TextStyle(fontSize: 20),
        // ),
      ],
    );
  }
}
