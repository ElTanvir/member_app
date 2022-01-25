// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable, avoid_dynamic_calls

import 'dart:convert';

class NewsCategoryModel {
  int id;
  String category_name;
  NewsCategoryModel({
    required this.id,
    required this.category_name,
  });

  NewsCategoryModel copyWith({
    int? id,
    String? category_name,
  }) {
    return NewsCategoryModel(
      id: id ?? this.id,
      category_name: category_name ?? this.category_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_name': category_name,
    };
  }

  factory NewsCategoryModel.fromMap(Map<String, dynamic> map) {
    return NewsCategoryModel(
      id: map['id']?.toInt() ?? 0,
      category_name: map['category_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsCategoryModel.fromJson(String source) =>
      NewsCategoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'NewsCategoryModel(id: $id, category_name: $category_name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsCategoryModel &&
        other.id == id &&
        other.category_name == category_name;
  }

  @override
  int get hashCode => id.hashCode ^ category_name.hashCode;
}
