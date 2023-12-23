//人数を選択するページ

import 'package:flutter/material.dart';
import '../../components/select_people/select_people.dart';
import '../now_playing/now_playing.dart';

import '../../components/text_button/text_button.dart';

import '../../participant/Participant.dart';


class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {

  var ranking = Participant.getRanking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スコアランキング'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for(int i=0;i<ranking.length; i++)
              if(ranking[i].id != 9999)
                Text('${i+1}位: ${ranking[i].id}番 ${ranking[i].score}点'),

          ],
        ),
      ),
    );
  }
}
