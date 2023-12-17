//Participantクラス
//ゲームの参加者を表すクラス。name, scoreを持つ。

import '../score/GameScore.dart';

class Participant {
  String name = "unknown";
  GameScore score = GameScore();
}