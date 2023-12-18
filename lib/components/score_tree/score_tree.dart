//スコアの木を生成するコンポーネント

import 'dart:math' as math;
import 'package:flutter/material.dart';

final Color primaryColor = Colors.orange;
const TargetPlatform platform = TargetPlatform.android;

void main() {
  runApp(XmasTree());
}

class ScoreXmasTree extends CustomPainter {
  final int treeSize;
  final int ballNum;

  ScoreXmasTree(this.treeSize, this.ballNum);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green;

    var leaves = Path();

    // クリスマスツリー頂点の座標
    Offset topPos = Offset(size.width / 2, size.height / 5);

    int i = 3;

    // クリスマスツリー頂点からの距離 dft: distance from top
    double dft = 0;

    // クリスマスツリーを構成する三角形の1辺の長さ
    double sideLength = 0;

    for (i = 0; i < treeSize; i++) {
      dft = topPos.dy + (1 / 2) * math.pow(i + 1, 2).toDouble();
      sideLength = 10 * (i + 1);

      leaves
        ..moveTo(topPos.dx, dft)
        ..lineTo(topPos.dx - sideLength * math.sin(math.pi / 6),
            dft + sideLength * math.cos(math.pi / 6))
        ..lineTo(topPos.dx + sideLength / 2,
            dft + sideLength * math.cos(math.pi / 6));
    }

    leaves.close();
    canvas.drawPath(leaves, paint);

    
    // もみの木のみき
    var trunkLeft = topPos.dx - i;
    var trunkTop = dft + sideLength * math.cos(math.pi / 6);
    var trunkWidth = 2 * i.toDouble();
    var trunkHeight = i.toDouble();

    paint.color = Colors.brown;
    var trunk = Rect.fromLTWH(trunkLeft, trunkTop, trunkWidth, trunkHeight);

    canvas.drawRect(trunk, paint);

    // スタンドカバー
    var standLeft = trunkLeft - i;
    var standTop = trunkTop + trunkHeight;
    var standWidth = 2 * trunkWidth;
    var standHeight = 2 * trunkHeight;
    var stand = Rect.fromLTWH(standLeft, standTop, standWidth, standHeight);
    canvas.drawRect(stand, paint);
    
    // ガーランド
    var garland = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = treeSize.toDouble() / 3;

    final garlandPath = Path();
    double startPointY = topPos.dy + (trunkTop - topPos.dy) * 1 / 3;
    double startPointX = topPos.dx - 12 * (treeSize / 3 + 1) / 2;
    garlandPath.moveTo(startPointX, startPointY);

    double endPointY = topPos.dy + (trunkTop - topPos.dy) * 2 / 3;
    double endPointX = topPos.dx + 20 * (treeSize / 3 + 1) / 2;

    garlandPath.quadraticBezierTo(startPointX, endPointY, endPointX, endPointY);

    canvas.drawPath(garlandPath, garland);

    // ボール
    List<MaterialColor> colorList = [
      Colors.red,
      Colors.blue,
      Colors.lightGreen
    ];
    for (int j = 0; j < ballNum; j++) {
      double randomPosY = math.Random().nextDouble() * (trunkTop - topPos.dy);
      double randomPosX =
          2 * (math.Random().nextDouble() - (1 / 2)) * randomPosY / 4;
      int randomColorIndex = math.Random().nextInt(colorList.length);
      paint.color = colorList[randomColorIndex];
      canvas.drawCircle(Offset(topPos.dx + randomPosX, topPos.dy + randomPosY),
          i * size.width / 1000, paint);
    }
    
    paint.color = Colors.yellow;
    var star = Path();

    double radius = i.toDouble();
    for (int j = 0; j < 6; j++) {
      var angle = -math.pi / 10 + j * 4 * math.pi / 5;
      star.lineTo(radius * math.cos(angle) + topPos.dx,
          radius * math.sin(angle) + topPos.dy);
    }

    canvas.drawPath(star, paint);
    
  }

  @override
  bool shouldRepaint(ScoreXmasTree oldDelegate) {
    // return false; // oldDelegate.seeds != seeds;
    return oldDelegate.treeSize != treeSize;
  }
}

class XmasTree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _XmasTreeState();
  }
}

enum barType {
  ballNum,
  treeSize,
}

class _XmasTreeState extends State<XmasTree> {
  int treeSize = 20;
  int ballNum = 10;

  Widget _adjustmentSlider(String barText, double min, double max, double value, barType bar) {
      return Column(
        children: [
          Text("$barText ${value.toInt()}"), // 整数型に戻して表示
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 200),
            child: Slider.adaptive(
              min: min,
              max: max,
              value: value, // ここではdouble型が使われる
              onChanged: (newValue) {
                setState(() {
                  if (bar == barType.ballNum) {
                    ballNum = newValue.toInt(); // newValueをint型に変換
                  } else if (bar == barType.treeSize) {
                    treeSize = newValue.toInt(); // newValueをint型に変換
                  }
                });
              },
            ),
          ),
        ],
      );
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        // platform: platform,
        brightness: Brightness.dark,
        sliderTheme: SliderThemeData.fromPrimaryColors(
          primaryColor: primaryColor,
          primaryColorLight: primaryColor,
          primaryColorDark: primaryColor,
          valueIndicatorTextStyle: const DefaultTextStyle.fallback().style,
        ),
      ),
      home: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                ),
                child: SizedBox(
                  width: 400,
                  height: 400,
                  child: CustomPaint(
                    painter: ScoreXmasTree(treeSize, ballNum),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _adjustmentSlider(
                      "木の大きさ", 3, 30, treeSize.toDouble(), barType.treeSize),
                  _adjustmentSlider(
                      "ボールの数", 1, 30, ballNum.toDouble(), barType.ballNum),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}