//スコアを表示するページ

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../../components/score_tree/score_tree.dart';
import '../../participant/Participant.dart';
import '../../score/AccelerometerResultsPerGame.dart';

class ScorePage extends StatefulWidget {
  final int selectedNumber;
  const ScorePage(this.selectedNumber);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int treeSize = 25; //おそらくmaxは25くらいsizedboxの大きさによって変わるけどもだりい
  int ballNum = 10;


  @override
  Widget build(BuildContext context) {
    var participant = Participant.getInstance(widget.selectedNumber);
    treeSize = (participant.score).toInt();
    ballNum = (participant.score).toInt();
    print("final score: ${participant.score}");


    return (
      Scaffold(
        appBar: AppBar(
          title: const Text('スコアの木'),
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Text("すごいです！, ${participant.score}点です!"),
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
      )
    );

  }
}
