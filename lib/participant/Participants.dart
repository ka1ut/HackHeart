import 'Participant.dart';


class Participants extends Iterable<Participant>{

  static Participants? _instance;
  late List<Participant> participants;
  Iterator<Participant> _iterator = List<Participant>.empty().iterator;

  static Participants initInstance(int numberOfParticipants) {
    _instance = Participants._def(numberOfParticipants);
    return _instance!;
  }

  static Participants getInstance() {
    return _instance!;
  }

  Participants._def(int numberOfParticipants) {
    participants = List<Participant>.filled(numberOfParticipants, Participant());
    _iterator = participants.iterator;
  }

  bool hasAllFinishedPlaying(){
    return participants.every((element) => element.isFinished);
  }

  Future<void> startNextPlayerGame(Duration timelimit) async {
    if (_iterator.moveNext()) {
      await _iterator.current.playGame(timelimit);
    }
  }

  //iterator
  Iterator<Participant> get iterator => participants.iterator;

  //getters
  int get length => participants.length;
  Participant get first => participants.first;
  Participant get last => participants.last;
  Participant get single => participants.single;
  Participant elementAt(int index) => participants.elementAt(index);
  bool get isEmpty => participants.isEmpty;
  bool get isNotEmpty => participants.isNotEmpty;

}