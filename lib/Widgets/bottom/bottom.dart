import 'package:dictionary_app_1/Widgets/Radio_buttons.dart';
import 'package:dictionary_app_1/controllers/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottom extends StatefulWidget {
  Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  TextEditingController _searchController = TextEditingController();

  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 66,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorController.selectedIndex.value == 0
                  ? Colors.blue
                  : Colors.black,
            ),
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 266,
                      height: 66,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child:
                          //SearchWay(),
                          TextFormField(
                        onTap: () {},
                        controller: _searchController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: colorController.selectedIndex.value == 0 ?'Type English Word...' : 'മലയാളത്തിൽ ടൈപ്പ് ചെയ്യുക...',
                            hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                  ),
                ],
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
        const RadioButtonsRow(),
      ]),
    );
  }
}
