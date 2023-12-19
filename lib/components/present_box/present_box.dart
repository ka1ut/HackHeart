import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class PresentBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // プレゼントボックスの座標とサイズ
    final boxLeft = size.width / 4;
    final boxTop = size.height / 4;
    final boxWidth = size.width / 2;
    final boxHeight = size.height / 2;

    // プレゼントボックスの描画
    paint.color = Colors.red;
    var boxRect = Rect.fromLTWH(boxLeft, boxTop, boxWidth, boxHeight);
    canvas.drawRect(boxRect, paint);

    // リボンの描画（縦）
    paint.color = Colors.red;
    final ribbonWidth = boxWidth / 10;
    var ribbonRect = Rect.fromLTWH(boxLeft + boxWidth / 2 - ribbonWidth / 2,
        boxTop, ribbonWidth, boxHeight);
    canvas.drawRect(ribbonRect, paint);

    // リボンの描画（横）
    final ribbonHeight = boxHeight / 10;
    ribbonRect = Rect.fromLTWH(boxLeft,
        boxTop + boxHeight / 2 - ribbonHeight / 2, boxWidth, ribbonHeight);
    canvas.drawRect(ribbonRect, paint);

    // リボンの蝶結び
    final bowRadius = ribbonWidth;
    final bowCenter = Offset(boxLeft + boxWidth / 2, boxTop + boxHeight / 2);
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(bowCenter, bowRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Painter Demo'),
        ),
        body: Center(
          child: CustomPaint(
            size: Size(200, 200), // カスタムペイントのサイズ
            painter: PresentBoxPainter(), // 作成したカスタムペインター
          ),
        ),
      ),
    );
  }
}
