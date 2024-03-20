import 'package:riverpod/riverpod.dart';

final score = StateProvider<int>((ref) => 0);
final challengesDone = StateProvider<int>((ref) => 0);
final index = StateProvider<int>((ref) => 0);
