import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  @override
  _NumberSelectorState createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  int selectedNumber = 1; // 初期値は1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Number'),
      ),
      body: Center(
        child: DropdownButton<int>(
          value: selectedNumber,
          items: List<DropdownMenuItem<int>>.generate(
            20,
            (index) => DropdownMenuItem(
              value: index + 1,
              child: Text('${index + 1}'),
            ),
          ),
          onChanged: (newValue) {
            setState(() {
              selectedNumber = newValue!;
            });
          },
        ),
      ),
    );
  }
}