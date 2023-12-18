import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final int selectedNumber;
  const GamePage({Key? key, required this.selectedNumber}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ゲームページ'),
      ),
      body: Center(
        child: Text('選択された番号: ${widget.selectedNumber}'),
      ),
    );
  }
}
