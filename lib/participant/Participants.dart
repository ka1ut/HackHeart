import 'Participant.dart';


class Participants extends Iterable<Participant>{
  late List<Participant> participants;

  Participants(int numberOfParticipants) {
    participants = List<Participant>.filled(numberOfParticipants, Participant());
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