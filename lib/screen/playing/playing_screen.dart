import 'package:flutter/material.dart';

class SubPage extends StatelessWidget {
  const SubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カッコよく振り回せ！'),
      ),
      body: const Center(
        child: Text('Welcome to Sub Page!'),
      ),
    );
  }
}
