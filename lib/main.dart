import 'package:dictionary_app_1/View/Home/home_page.dart';
import 'package:dictionary_app_1/data/datamodel.dart';
import 'package:dictionary_app_1/models/history/history.dart';
import 'package:dictionary_app_1/models/search/hive_datamodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize hive
  await Hive.initFlutter();
  // regiter the type adapter
  Hive.registerAdapter(SearchHistoryAdapter());
  await Hive.openBox<Searchword>('myDataBox');
  Hive.registerAdapter(SearchwordAdapter());
  await Hive.openBox<Searchword>("myDataBox");
  late Box<Searchword> dictionaryBox = Hive.box<Searchword>("myDataBox");
  // check the hive box if it is empty load data from the csv file
  if (dictionaryBox.isEmpty) {
    loadData();
  }
  

  loadData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        debugShowCheckedModeBanner: false,
        title: 'Dictionary',
        home: Containers());
  }
}
