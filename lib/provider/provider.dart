import 'package:riverpod/riverpod.dart';

final score = StateProvider<int>((ref) => 0);
final classroomDone = StateProvider<bool>((ref) => false);
final friendsDone = StateProvider<bool>((ref) => false);
final hospitalDone = StateProvider<bool>((ref) => false);
final challengesDone = StateProvider<int>((ref) => 0);
final index = StateProvider<int>((ref) => 0);
final quizNumber = StateProvider<int>((ref) => 1);
final topic = StateProvider<String>((ref) => '');
