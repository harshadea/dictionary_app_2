import 'package:dictionary_app_1/Widgets/Radio_buttons.dart';
import 'package:dictionary_app_1/Widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            bottom: TabBar(
              tabs: [
                //   onChanged: (val) {
                //     Hive.box(themeBox).put('darkMode', !value);
                //   },

                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Card(
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Card(
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
                //more tabs here
              ],
              //indicatorColor: Colors.grey,
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
                    // print('Notification');
                  })
            ],
            backgroundColor: Colors.blue,
            elevation: 4),
        // drawerScrimColor: Colors.black,

        drawer: const dDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end, 
          children: [


          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 66,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: Row(children: [
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        showDialog(
                            barrierColor: Colors.black87,
                            context: context,
                            builder: (_) => AlertDialog(
                                elevation: 4,
                                scrollable: true,
                                title: AppBar(
                                  title: const Text('Eng History'),
                                ),
                                content: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      height: 455,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Center(
                                        child: Text(
                                          'Nothing Found.....!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                )));
                      },
                      icon: const Icon(
                        Icons.history_outlined,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 222,
                    height: 66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child:
                        //SearchWay(),
                        const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Type English Word',
                          hintStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mic_none_outlined,
                      color: Colors.white,
                      size: 30,
                    ))
              ]),
            ),
          ),
          const RadioButtonsRow()
        ]),
      ),
    );
  }
}
