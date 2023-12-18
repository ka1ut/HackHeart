import './AccelerometerResultsPerGame.dart';
import 'dart:math';

class GameScore{
  int _score = 0;

  GameScore(){
  }
  GameScore.def(AccelerometerResultsPerGame accelerometerResultsPerGame){
    for(var i = 0; i < accelerometerResultsPerGame.length-1; i++){
      var deltaX = accelerometerResultsPerGame.elementAt(i+1).x - accelerometerResultsPerGame.elementAt(i).x;
      var deltaY = accelerometerResultsPerGame.elementAt(i+1).y - accelerometerResultsPerGame.elementAt(i).y;
      var deltaZ = accelerometerResultsPerGame.elementAt(i+1).z - accelerometerResultsPerGame.elementAt(i).z;


      _score = sqrt(deltaX*deltaX + deltaY*deltaY + deltaZ*deltaZ).toInt();
    }
  }

  int get score => _score;
}