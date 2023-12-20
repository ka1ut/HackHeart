import 'package:hackxmas/score/AccelerometerResultsPerGame.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Accelerometer{


  Future< ThreeDPoint > getAccelerometerData() async{
    var point = ThreeDPoint.def();
    accelerometerEventStream().listen((test){
      point = ThreeDPoint(test.x, test.y, test.z);
    });
    return point;
  }
}