import 'package:csv/csv.dart';
import 'package:dictionary_app_1/Widgets/bottom/bottom.dart';
import 'package:dictionary_app_1/Widgets/drawer.dart';
import 'package:dictionary_app_1/containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> _data = [];

  // ignore: unused_element
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/images/olam-enml.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    // print(_data);
    print(_data.length);
    setState(() {
      _data = _listData;
    });
  }

  TabController? _tabController;

  int selectedindex = 0;

  late bool color;

  Color engColor = Colors.blue;
  Color malColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: selectedindex == 0 ? Colors.blue : Colors.white,
            bottom: TabBar(
              controller: _tabController,
              onTap: (int index) {
                switch (index) {
                  case 0:
                    setState(() {
                      engColor = Colors.white;
                      malColor = Colors.grey;
                    });
                    break;
                  case 1:
                    setState(() {
                      engColor = Colors.grey;
                      malColor = Colors.white;
                    });
                }
              },
              tabs: [
                GestureDetector(
                  // onTap: _loadCSV,
                  child: Tab(
                    child: Card(
                        color: engColor,
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
                ),
                GestureDetector(
                  // onTap: _loadCSV,
                  child: Tab(
                    child: Card(
                        color: malColor,
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
                ),
              ],
              // indicatorColor: Colour ? Colors.black : Colors.amber,
            ),
            title: const Text('English -> മലയാളം ...',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
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
        body: TabBarView(controller: _tabController, children: [
          ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) => Card(
              //english to malayalam
              elevation: 5,
              child: ListTile(
                  // title: Text('english to malayalam'),
                  // trailing: Text("_data[_selectedIndex][0].toString()"),
                  // leading: Text("_data[_selectedIndex][1].toString()"),
                  // subtitle: Text("_data[_selectedIndex][2].toString()"),
                  ),
            ),
          ),
          Card(
            //malayalam to english
            elevation: 5,
            child: ListTile(
                // title: Text('malayalam to english'),
                // trailing: Text("_data[_selectedIndex][0].toString()"),
                // leading: Text("_data[_selectedIndex][1].toString().trim()"),
                // subtitle: Text("_data[_selectedIndex][2].toString()"),
                ),
          ),
        ]),
        bottomNavigationBar: Bottom(),
      ),
    );
  }
}
