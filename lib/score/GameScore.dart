import './AccelerometerResultsPerGame.dart';
import 'dart:math';

class GameScore{
  double _score = 0;
  int _numberOfItems = 0;
  int _wei = 10;
  var _accelerometerResultsPerGame = AccelerometerResultsPerGame();

  GameScore(){
  }
  GameScore.def(AccelerometerResultsPerGame accelerometerResultsPerGame){
    _accelerometerResultsPerGame = accelerometerResultsPerGame;
    for(var i = 0; i < accelerometerResultsPerGame.length-1; i++){
      var deltaX = accelerometerResultsPerGame.elementAt(i+1).x - accelerometerResultsPerGame.elementAt(i).x;
      var deltaY = accelerometerResultsPerGame.elementAt(i+1).y - accelerometerResultsPerGame.elementAt(i).y;
      var deltaZ = accelerometerResultsPerGame.elementAt(i+1).z - accelerometerResultsPerGame.elementAt(i).z;

      _score = deltaX*deltaX + deltaY*deltaY + deltaZ*deltaZ;
    }
    _numberOfItems = accelerometerResultsPerGame.length;
  }

  void addScore(double score){
    _score += score;
    _numberOfItems++;
    print("score: $_score, numberOfItems: $_numberOfItems, arg: $score");
  }

  int get size => _numberOfItems;
  int get score => (_score / 123400 * 60).toInt();
  AccelerometerResultsPerGame get accelerometerResultsPerGame => _accelerometerResultsPerGame;
}