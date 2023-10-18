// ignore: file_names
import 'package:flutter/material.dart';

class RadioButtonsRow extends StatefulWidget {
  const RadioButtonsRow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RadioButtonsRowState createState() => _RadioButtonsRowState();
}

class _RadioButtonsRowState extends State<RadioButtonsRow> {
  // Initialize with the default selected value.

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
