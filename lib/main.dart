import 'package:flutter/material.dart';
import 'screen/playing/playing_screen.dart';
import 'screen/select_people/select_people.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'HackUkosen'),
      routes: {
        '/playing': (context) => SubPage(),
        '/NumberSelector': (context) => NumberSelector() // ルートを追加
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/playing'), // ボタンを押したときのアクション
              child: const Text('始めようぜ！'),
            ),
            SizedBox(height: 20), // ボタンの間にスペースを追加
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/NumberSelector'),
              child: const Text('人数を選択する'),
            ),
          ],
        ),
      ),
    );
  }
}

