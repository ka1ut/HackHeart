//人数を選択するページ

import 'package:flutter/material.dart';
import '../../components/select_people/select_people.dart';
import '../now_playing/now_playing.dart';

import '../../components/text_button/text_button.dart';

import '../../participant/Participants.dart';

class PlayingPage extends StatefulWidget {
  const PlayingPage({Key? key}) : super(key: key);

  @override
  _PlayingPageState createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  int selectedNumber = 1;

  void updateSelectedNumber(int newNumber) {
    setState(() {
      selectedNumber = newNumber;
    });
  }

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
            NumberSelector(
              onNumberSelected: updateSelectedNumber,
            ),
            CustomButton(
              text: '次へ',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GamePage(
                            selectedNumber: selectedNumber,
                          )),
                );
                var participants = Participants.initInstance(selectedNumber);
              },
            ),
          ],
        ),
      ),
    );
  }
}
