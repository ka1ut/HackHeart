//Participantクラス
//ゲームの参加者を表すクラス。name, scoreを持つ。

import 'package:hackxmas/score/AccelerometerResultsPerGame.dart';
import 'dart:math';

import '../score/GameScore.dart';
import '../score/Accelerometer.dart';

class Participant {
  static Map<int, Participant> allParticipants = Map<int, Participant>();
  int _id = 0;

  ThreeDPoint lastPoint = ThreeDPoint.def();
  bool _isFinished = false;
  GameScore _score = GameScore();
  static var accelerometer = Accelerometer();

  static Participant getInstance(int id){
    //allParticipantsが空ならAccelerometer.getAccelerometerData()を呼びだす
    if(allParticipants.isEmpty){
      accelerometer.getAccelerometerData();
    }

    if(allParticipants.containsKey(id)){
      return allParticipants[id]!;
    }else{
      return Participant._def(id);
    }
  }

  Participant._def(int id){
    _id = id;
    allParticipants[id] = this;
  }



  Future<void> playGame(Duration timelimit) async {
    var tmpGameresult = AccelerometerResultsPerGame();
    var timer = Stopwatch();
    //タイマーが切れるまで、GetAccelerometerDataを呼び出し、
    timer.start();
    while (timer.elapsed < timelimit) {
      tmpGameresult.add(accelerometer.point);
    }

    //ゲーム終了後、スコアを計算する
    _score = GameScore.def(tmpGameresult);
    _isFinished = true;

  }

  void addScore(ThreeDPoint point){
    var score = (point.x - lastPoint.x)*(point.x - lastPoint.x) + (point.y - lastPoint.y)*(point.y - lastPoint.y) + (point.z - lastPoint.z)*(point.z - lastPoint.z);
    _score.addScore(score.toDouble());

    lastPoint = point;
  }

  int get id => _id;
  int get score => _score.score;
  bool get isFinished => _isFinished;
  int get size => _score.size;
}