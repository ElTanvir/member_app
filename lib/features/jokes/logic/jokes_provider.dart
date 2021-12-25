import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/jokes/data/jokes.dart';
import 'package:member_app/features/jokes/data/jokes_repo.dart';
import 'package:member_app/features/jokes/logic/jokes_notfier.dart';
import 'package:member_app/utils/api_state.dart';

final jokesRepositoryProvider =
    Provider<JokesRepository>((red) => JokesRepository());

final jokesProvider =
    StateNotifierProvider<JokesNotfier, ApiState<Jokes>>((ref) {
  return JokesNotfier(ref.watch(jokesRepositoryProvider));
});
