import 'package:dio/dio.dart';
import 'package:member_app/features/jokes/data/jokes.dart';

abstract class IJokesRepository {
  Future<Jokes> getJoke({required String category, required String type});
}

class JokesRepository extends IJokesRepository {
  final dio = Dio();
  final url = 'https://v2.jokeapi.dev/joke/';

  @override
  Future<Jokes> getJoke(
      {required String category, required String type}) async {
    final result = await dio.get('$url$category?type=$type');
    return Jokes.fromMap(result.data);
  }
}
