import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/newsportal/data/data_models/category_model.dart';
import 'package:member_app/features/newsportal/data/data_models/news_response.dart';
import 'package:member_app/features/newsportal/data/newsportal_repository.dart';
import 'package:member_app/features/newsportal/logic/newsportal_notfier.dart';
import 'package:member_app/features/pagination/logic/pagination_provider.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/utils/utility_provider.dart';

final newsPortalRepoProvider = Provider<INewsRepository>((ref) => NewsRepo());

/*
Fetches All the News Category
*/
final newsCategoryProvider = StateNotifierProvider.autoDispose<
    NewsCategoryNotifier, ApiState<List<NewsCategoryModel>>>(
  (ref) => NewsCategoryNotifier(
    ref.watch(dioProvider),
    ref.watch(newsPortalRepoProvider),
  ),
);
/*
Fetches All the News for Selected Category
*/
final newsResponseProvider = StateNotifierProvider.family
    .autoDispose<NewsResponseNotifier, ApiState<NewsResponse>, String>(
  (ref, name) => NewsResponseNotifier(
    ref.watch(dioProvider),
    ref.watch(newsPortalRepoProvider),
    ref.watch(paginationIndexProvider(name)),
    ref.watch(newsCatProvider(name)),
  ),
);

/*
Allows Selecting News Category
*/
final newsCatProvider =
    StateNotifierProvider.autoDispose.family<NewsCatNotifier, String, String>(
  (ref, id) => NewsCatNotifier(),
);
