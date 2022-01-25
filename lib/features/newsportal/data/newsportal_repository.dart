import 'package:dio/dio.dart';
import 'package:member_app/features/newsportal/data/data_models/category_model.dart';
import 'package:member_app/features/newsportal/data/data_models/news_response.dart';

abstract class INewsRepository {
  Future<List<NewsCategoryModel>> getNewsCategory({
    required Dio dio,
  });
  Future<NewsResponse> getNewsResponse({
    required String category,
    required int page,
    required Dio dio,
  });
}

class NewsRepo extends INewsRepository {
  @override
  Future<List<NewsCategoryModel>> getNewsCategory({
    required Dio dio,
  }) async {
    final Response response = await dio.get('/all_category');
    final List<NewsCategoryModel> data = [];
    // ignore: avoid_dynamic_calls
    for (final item in response.data['data']) {
      data.add(NewsCategoryModel.fromMap(item as Map<String, dynamic>));
    }
    return data;
  }

  @override
  Future<NewsResponse> getNewsResponse({
    required String category,
    required int page,
    required Dio dio,
  }) async {
    final Response response =
        await dio.get('/news?category_id=$category&page=$page');
    // ignore: avoid_dynamic_calls
    return NewsResponse.fromMap(response.data as Map<String, dynamic>);
  }
}
