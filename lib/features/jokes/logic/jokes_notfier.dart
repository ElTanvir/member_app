import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/jokes/data/jokes.dart';
import 'package:member_app/features/jokes/data/jokes_repo.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/services/network_exceptions.dart';

class JokesNotfier extends StateNotifier<ApiState<Jokes>> {
  final JokesRepository _jokesRepository;
  JokesNotfier(this._jokesRepository) : super(const ApiState.initial()) {
    getJoke(category: 'any', type: 'twopart');
  }
  Future<void> getJoke({required String category, required String type}) async {
    try {
      state = const ApiState.loading();
      final joke =
          await _jokesRepository.getJoke(category: category, type: type);
      state = ApiState.loaded(data: joke);
    } catch (e) {
      state = ApiState.error(error: NetworkExceptions.getDioException(e));
    }
  }
}
