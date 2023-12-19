//Participantクラス
//ゲームの参加者を表すクラス。name, scoreを持つ。

import 'package:hackxmas/score/AccelerometerResultsPerGame.dart';

import '../score/GameScore.dart';
import '../score/Accelerometer.dart';

class Participant {
  static int _currentMaxId = 0;
  bool _isFinished = false;
  int _id = _currentMaxId;
  GameScore _score = GameScore();
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
    _score = GameScore.def(tmpGameresult);
    _isFinished = true;

  }

  int get id => _id;
  int get score => _score.score;
  bool get isFinished => _isFinished;
}