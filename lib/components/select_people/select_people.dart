import 'package:flutter/material.dart';

class NumberSelector extends StatefulWidget {
  final Function(int) onNumberSelected;

  NumberSelector({Key? key, required this.onNumberSelected}) : super(key: key);

  @override
  _NumberSelectorState createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  int selectedNumber = 1; // 初期値は1

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<int>(
        value: selectedNumber,
        style: TextStyle(fontSize: 24, color: Colors.black),
        itemHeight: 60,
        items: List<DropdownMenuItem<int>>.generate(
          10,
          (index) => DropdownMenuItem(
            value: index + 1,
            child: Text('${index + 1}'),
          ),
        ),
        onChanged: (newValue) {
          setState(() {
            selectedNumber = newValue!;
          });
          widget.onNumberSelected(selectedNumber);
        },
      ),
    );
  }
}
