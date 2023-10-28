// ignore: camel_case_types
import 'package:dictionary_app_1/controllers/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class dDrawer extends StatefulWidget {
  const dDrawer({
    super.key,
  });

  @override
  State<dDrawer> createState() => _dDrawerState();
}

class _dDrawerState extends State<dDrawer> {
  final ColorController colorController = Get.put(ColorController());

  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(
                          color: colorController.selectedIndex.value == 0
                              ? Colors.blue
                              : Colors.black),
                      child: Center(
                          child: colorController.selectedIndex.value == 0
                              ? Text(
                                  'ENGLISH <-> മലയാളം Dictionary',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  'മലയാളം <-> ENGLISH Dictionary',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ))),
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 200,
                                width: 355,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(22),
                                        child: Text(
                                          'Warning....!',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text(
                                          'Would you like to delete search history',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 22),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Get.close(1);
                                              },
                                              child: const Text('Continue'),
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    leading: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                      size: 25,
                    ),
                    title: const Text(
                      'Delete History',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.keyboard,
                      size: 25,
                      color: Colors.blue,
                    ),
                    title: const Text(
                      'Go to Google Indic Keyboard',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                elevation: 4,
                                //centerTitle: true,
                                title: const Text('Settings'),
                              ),
                              body: Column(children: [
                                ListTile(
                                  title: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Enable Manglish',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  trailing: Switch(
                                    activeColor: Colors.green,
                                    value: isSwitched1,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched1 = (value);
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.lightBlue,
                                    child: const Text(
                                      'മലയാളം ഉച്ചാരണം ആരുടെ ശബ്ദം വേണം..?',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Enable ആൺകുട്ടി',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  trailing: Switch(
                                    activeColor: Colors.green,
                                    value: isSwitched2,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched2 = (value);
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Enable മുതിർന്ന പുരുഷന്‍ 1',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  trailing: Switch(
                                    activeColor: Colors.green,
                                    value: isSwitched3,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched3 = (value);
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Enable മുതിർന്ന പുരുഷന്‍ 2',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  trailing: Switch(
                                    activeColor: Colors.green,
                                    value: isSwitched4,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched4 = (value);
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Enable സ്ത്രീ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  trailing: Switch(
                                    activeColor: Colors.green,
                                    value: isSwitched5,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched5 = (value);
                                      });
                                    },
                                  ),
                                ),
                              ]),
                            );
                          });
                    },
                    leading: const Icon(
                      Icons.settings,
                      size: 25,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      'Settings',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      showDialog(
                          barrierColor: Colors.black87,
                          context: context,
                          builder: (_) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 355,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(22),
                                            child: Center(
                                              child: CircleAvatar(
                                                  backgroundColor: Colors.red,
                                                  radius: 55,
                                                  child: CircleAvatar(
                                                    radius: 52,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.red,
                                                      size: 66,
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Redirect ALERT',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  'You are about to redirect playstore to review malayalam english dictionaryplease click',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                                SizedBox(height: 5),
                                                Text('OK to proceed',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateColor
                                                              .resolveWith(
                                                                  (states) =>
                                                                      Colors
                                                                          .red)),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 22),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Get.close(1);
                                                  },
                                                  child: const Text('Continue'),
                                                ),
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                ],
                              ));
                    },
                    leading: const Icon(
                      Icons.star,
                      size: 25,
                      color: Colors.amber,
                    ),
                    title: const Text(
                      'Rate Us',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      showAboutDialog(context: context);
                    },
                    leading: const Icon(
                      Icons.account_circle,
                      size: 25,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      'About Us',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            );
  }
}
