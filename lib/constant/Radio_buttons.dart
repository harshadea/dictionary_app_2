// ignore: file_names
import 'package:dictionary_app_1/controllers/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioButtonsRow extends StatefulWidget {
  const RadioButtonsRow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RadioButtonsRowState createState() => _RadioButtonsRowState();
}

class _RadioButtonsRowState extends State<RadioButtonsRow> {
  // Initialize with the default selected value.
  final ColorController colorController = Get.put(ColorController());
  int selectedValue = 0;

  void handleRadioValueChange(int? value) {
    setState(() {
      selectedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          activeColor: colorController.selectedIndex.value == 0
              ? Colors.blue
              : Colors.black,
          value: 0,
          groupValue: selectedValue,
          onChanged: handleRadioValueChange,
        ),
        const Text(
          'StartWith',
          style: TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Radio(
          activeColor: colorController.selectedIndex.value == 0
              ? Colors.blue
              : Colors.black,
          value: 1,
          groupValue: selectedValue,
          onChanged: handleRadioValueChange,
        ),
        const Text(
          'Contains',
          style: TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Radio(
          activeColor: colorController.selectedIndex.value == 0
              ? Colors.blue
              : Colors.black,
          value: 2,
          groupValue: selectedValue,
          onChanged: handleRadioValueChange,
        ),
        const Text(
          'EndWith',
          style: TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Swtchs extends StatefulWidget {
  const Swtchs({super.key});

  @override
  State<Swtchs> createState() => _SwtchsState();
}

class _SwtchsState extends State<Swtchs> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text('Switch is $isSwitched'),
        // Switch(
        //   value: isSwitched,
        //   onChanged: (value) {
        //     setState(() {
        //       isSwitched = value;
        //     });
        //   },
        // ),
      ],
    );
  }
}
