//スコアを表示するページ

import 'package:flutter/material.dart';
import '../../components/score_tree/score_tree.dart';

class ScorePage extends StatefulWidget {

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int treeSize = 25; //おそらくmaxは25くらいsizedboxの大きさによって変わるけどもだりい
  int ballNum = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('スコアの木'),
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Text("すごいです！"),
            CustomPaint(
              child: SizedBox(
                width: 500,
                height: 800,
                child: CustomPaint(
                  painter: XmasTreePainter(treeSize, ballNum),
                ),
              ),
            ),
          ])),
        ),
      ),
    );
  }
}
