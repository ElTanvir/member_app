import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:member_app/features/newsportal/data/data_models/news_model.dart';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable, avoid_dynamic_calls

class NewsResponse {
  List<NewsModel> data;
  int last_page;
  NewsResponse({
    required this.data,
    required this.last_page,
  });

  NewsResponse copyWith({
    List<NewsModel>? data,
    int? last_page,
  }) {
    return NewsResponse(
      data: data ?? this.data,
      last_page: last_page ?? this.last_page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'last_page': last_page,
    };
  }

  factory NewsResponse.fromMap(Map<String, dynamic> map) {
    return NewsResponse(
      data: List<NewsModel>.from(map['data']?.map((x) => NewsModel.fromMap(x))),
      last_page: map['last_page']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsResponse.fromJson(String source) =>
      NewsResponse.fromMap(json.decode(source));

  @override
  String toString() => 'NewsResponse(data: $data, last_page: $last_page)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsResponse &&
        listEquals(other.data, data) &&
        other.last_page == last_page;
  }

  @override
  int get hashCode => data.hashCode ^ last_page.hashCode;
}
