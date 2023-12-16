import 'Participant.dart';


class Participants{
  late List<Participant> participants;

  Participants(int numberOfParticipants) {
    participants =
    List<Participant>.filled(numberOfParticipants, Participant());
    for (int i = 0; i < numberOfParticipants; i++) {
      participants[i] = Participant();
    }
  }
}