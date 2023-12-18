//Participantクラス
//ゲームの参加者を表すクラス。name, scoreを持つ。

import 'package:hackxmas/score/AccelerometerResultsPerGame.dart';

import '../score/GameScore.dart';
import '../score/Accelerometer.dart';

class Participant {
  static int _currentMaxId = 0;
  int _id = _currentMaxId;
  GameScore score = GameScore();
  var accelerometer = Accelerometer();

  Participant(){
    _id = _currentMaxId;
    _currentMaxId++;
  }

  Future<void> playGame(Duration timelimit) async {
    var tmpGameresult = AccelerometerResultsPerGame();
    var timer = Stopwatch();
    //タイマーが切れるまで、GetAccelerometerDataを呼び出し、
    timer.start();
    while (timer.elapsed < timelimit) {
      tmpGameresult.add(await accelerometer.getAccelerometerData());
    }

    //ゲーム終了後、スコアを計算する
    score = GameScore.def(tmpGameresult);

  }

  int get id => _id;
}