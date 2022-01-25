import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/newsportal/data/data_models/category_model.dart';
import 'package:member_app/features/newsportal/data/data_models/news_response.dart';
import 'package:member_app/features/newsportal/data/newsportal_repository.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/services/network_exceptions.dart';

class NewsCategoryNotifier
    extends StateNotifier<ApiState<List<NewsCategoryModel>>> {
  final Dio dio;
  final INewsRepository newsRepository;

  NewsCategoryNotifier(this.dio, this.newsRepository)
      : super(const ApiState.initial()) {
    getNewsCategory();
  }
  Future<void> getNewsCategory() async {
    state = const ApiState.loading();
    try {
      final List<NewsCategoryModel> data =
          await newsRepository.getNewsCategory(dio: dio);
      state = ApiState.loaded(data: data);
    } catch (e) {
      state = ApiState.error(
        error: NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}

class NewsResponseNotifier extends StateNotifier<ApiState<NewsResponse>> {
  final Dio dio;
  final int page;
  final String category;
  final INewsRepository newsRepository;

  NewsResponseNotifier(this.dio, this.newsRepository, this.page, this.category)
      : super(const ApiState.initial()) {
    getNewsResponse();
  }
  Future<void> getNewsResponse() async {
    state = const ApiState.loading();
    try {
      final NewsResponse data = await newsRepository.getNewsResponse(
        category: category,
        page: page,
        dio: dio,
      );
      state = ApiState.loaded(data: data);
    } catch (e) {
      state = ApiState.error(
        error: NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(e),
        ),
      );
    }
  }
}

class NewsCatNotifier extends StateNotifier<String> {
  NewsCatNotifier() : super('');

  @override
  set state(String value) {
    super.state = value;
  }
}
