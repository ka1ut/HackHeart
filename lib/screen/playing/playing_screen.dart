import 'package:flutter/material.dart';
import '../../components/select_people/select_people.dart';

class PlayingPage extends StatelessWidget {
  const PlayingPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('人数を選択して下さい'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NumberSelector(),
          ],
        ),
      ),



    );
  }
}
