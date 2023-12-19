//スコアの木を生成するコンポーネント
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BallDetails {
  Offset position;
  Color color;
  double size;

  BallDetails(this.position, this.color, this.size);
}

class XmasTreePainter extends CustomPainter {
  final int treeSize;
  final int ballNum;
  final List<BallDetails> balls;

  XmasTreePainter(this.treeSize, this.ballNum)
      : balls = List.generate(ballNum, (index) {
          double randomPosY = math.Random().nextDouble();
          double randomPosX = math.Random().nextDouble();

          //ball color
          List<Color> colorList = [
            Color.fromARGB(255, 255, 97, 97),
            Color.fromARGB(255, 22, 150, 255),
            Color.fromARGB(255, 0, 255, 255),
            Color.fromARGB(255, 0, 255, 81),
            Color.fromARGB(255, 255, 215, 0),
            Color.fromARGB(255, 255, 138, 206),
          ];
          int randomColorIndex = math.Random().nextInt(colorList.length);
          Color randomColor= colorList[randomColorIndex];

          double minSize = treeSize / 2 - treeSize / 5;
          double maxSize = treeSize / 2;
          double randomSize = minSize + math.Random().nextDouble() * (maxSize - minSize);

          return BallDetails(Offset(randomPosX, randomPosY), randomColor, randomSize);
        });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color.fromRGBO(0, 168, 109, 1);

    var leaves = Path();

    // クリスマスツリー頂点の座標
    Offset topPos = Offset(size.width / 2, size.height / 5);
    int i = 3;
    double dft = 0;
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

    paint.color = Color.fromARGB(255, 86, 40, 25);
    var trunk = Rect.fromLTWH(trunkLeft, trunkTop, trunkWidth, trunkHeight);

    canvas.drawRect(trunk, paint);

    // スタンドカバー
    paint.color = Color.fromARGB(255, 151, 53, 21);
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
    double minSize = treeSize / 2 - treeSize / 5;
    for (int j = 0; j < ballNum; j++) {
      double randomPosY = balls[j].position.dy * (trunkTop - topPos.dy - minSize);
      double randomPosX = 2 * (balls[j].position.dx - 0.5) * randomPosY / 4;
      Paint ballPaint = Paint()..color = balls[j].color;
      canvas.drawCircle(Offset(topPos.dx + randomPosX, topPos.dy + randomPosY), balls[j].size, ballPaint);
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
  bool shouldRepaint(XmasTreePainter oldDelegate) {
    // return false; // oldDelegate.seeds != seeds;
    return oldDelegate.treeSize != treeSize;
  }
}



// void main() {
//   runApp(XmasTree());
// }

// class XmasTree extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _XmasTreeState();
//   }
// }

// class _XmasTreeState extends State<XmasTree> {
//   int treeSize = 25;//おそらくmaxは25くらいsizedboxの大きさによって変わるけどもだりい
//   int ballNum = 10;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//                 title: const Text('スコアの木'),
//               ),
//         body: Center(
//           child:SingleChildScrollView(
//               child: Column(children: <Widget>[
//                 Text("すごいです！"),
//                 CustomPaint(
//                   child: SizedBox(
//                     width: 500,
//                     height: 800,
//                     child: CustomPaint(
//                       painter: XmasTreePainter(treeSize, ballNum),
//                     ),
//                   ),
//                 ),
//               ])
//             ),  
//           ),
//       ), 
//     );
//   }
// }