import 'package:dictionary_app_1/View/home_page.dart';
import 'package:dictionary_app_1/containers.dart';
import 'package:dictionary_app_1/controllers/datamodel.dart';
import 'package:dictionary_app_1/controllers/history/history.dart';
import 'package:dictionary_app_1/controllers/hive/hive_datamodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SearchwordAdapter());
  Hive.registerAdapter(SearchHistoryAdapter());
  await Hive.openBox<Searchword>('myDataBox');

  loadData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        title: 'Dictionary',
        home: Containers());
  }
}
