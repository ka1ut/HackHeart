import 'package:flutter/cupertino.dart';
import 'package:hackxmas/score/AccelerometerResultsPerGame.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Accelerometer{
  ThreeDPoint _point = ThreeDPoint.def();

  Future<void> getAccelerometerData() async{

  }

  ThreeDPoint get point => _point;
}