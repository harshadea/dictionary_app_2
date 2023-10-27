import 'package:csv/csv.dart';
import 'package:dictionary_app_1/Widgets/bottom/bottom.dart';
import 'package:dictionary_app_1/Widgets/drawer.dart';
import 'package:dictionary_app_1/controllers/getx_controller.dart';
import 'package:dictionary_app_1/controllers/hive/hive_datamodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Containers extends StatefulWidget {
  const Containers({super.key});

  @override
  State<Containers> createState() => _ContainersState();
}

class _ContainersState extends State<Containers> {
  int? selectedItemIndex;

  TabController? _tabController;

  late Future<List<Searchword>> dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = readData();
  }

  Future<List<Searchword>> readData() async {
    await Hive.openBox<Searchword>('myDataBox');
    final Box<Searchword> dictionaryBox = Hive.box<Searchword>("myDataBox");
    List<Searchword> data = dictionaryBox.values.toList();
    return data;
  }

  final ColorController colorController = Get.put(ColorController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: colorController.selectedIndex.value == 0
                ? Colors.blue
                : Colors.black,
            bottom: TabBar(
                indicatorColor: colorController.selectedIndex.value == 1
                    ? Colors.blue
                    : Colors.black,
                controller: _tabController,
                onTap: (int index) {
                  setState(() {
                    colorController.selectedIndex.value = index;
                  });
                },
                tabs: [
                  Tab(
                    child: Card(
                        color: colorController.selectedIndex.value == 0
                            ? Colors.white
                            : Colors.blue,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: const SizedBox(
                            width: 222,
                            height: 44,
                            child: Tab(
                                icon: Text(
                              'Eng -> മലയാളം',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )))),
                  ),
                  Tab(
                    child: Card(
                        color: colorController.selectedIndex.value == 0
                            ? Colors.white
                            : Colors.blue,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: const SizedBox(
                            width: 222,
                            height: 44,
                            child: Tab(
                                icon: Text(
                              'മലയാളം -> Eng',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )))),
                  ),
                ]),
            centerTitle: true,
            title: colorController.selectedIndex.value == 0
                ? Text('English -> മലയാളം ...',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))
                : Text('മലയാളം -> English'),
            actions: [
              IconButton(
                  icon: const Icon(Icons.share, color: Colors.amber),
                  onPressed: () {
                    // Get.to(Containers());

                    // print('Notification');
                  })
            ],
            elevation: 4),
        drawerScrimColor: Colors.black87,
        drawer: const dDrawer(),
        // body: FutureBuilder<List<Searchword>>(
        //     future: dataFuture,
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       } else if (snapshot.hasError) {
        //         return Center(
        //           child: Text('Error: ${snapshot.error}'),
        //         );
        //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //         return const Center(
        //           child: Text('No data available.'),
        //         );
        //       } else {
        //         return ListView.builder(
        //             itemCount: snapshot.data!.length,
        //             itemBuilder: (context, index) {
        //               final item = snapshot.data![index];
        //               return Padding(
        //                 padding: const EdgeInsets.all(12),
        //                 child: GestureDetector(
        //                   onTap: () {
        //                     setState(() {
        //                       selectedItemIndex = index;
        //                     });
        //                   },
        //                   child: Card(
        //                     elevation: 11,
        //                     margin: EdgeInsets.all(3),
        //                     color: selectedItemIndex == index
        //                         ? Colors.blue
        //                         : Colors.grey,
        //                     child: ListTile(
        //                       title: Text(
        //                         item.englishword.toString(),
        //                         style: TextStyle(
        //                             color: selectedItemIndex == index
        //                                 ? Colors.white
        //                                 : Colors.black),
        //                       ),
        //                       subtitle: Text(
        //                         item.malayalam_definition.toString().trim(),
        //                         style: TextStyle(
        //                             color: selectedItemIndex == index
        //                                 ? Colors.white
        //                                 : Colors.black),
        //                       ),
        //                       trailing: Text(
        //                         item.part_of_speech.toString(),
        //                         style: TextStyle(
        //                             color: selectedItemIndex == index
        //                                 ? Colors.white
        //                                 : Colors.black),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               );
        //             });
        //       }
        //     }),

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     InkWell(
        //         onTap: () {
        //           setState(() {
        //             malcolor = Colors.amber;
        //             engcolor = Colors.blue;
        //           });
        //         },
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Container(
        //             color: malcolor,
        //             height: 155,
        //             width: 155,
        //           ),
        //         )),
        //     Spacer(),
        //     InkWell(
        //         onTap: () {
        //           setState(() {
        //             engcolor = Colors.amber;
        //             malcolor = Colors.blue;
        //           });
        //         },
        //         child: Container(
        //           color: engcolor,
        //           height: 155,
        //           width: 155,
        //         ))
        //   ],
        // ),
        bottomNavigationBar: Bottom(),
      ),
    );
  }
}
