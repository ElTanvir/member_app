import 'dart:convert';

// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class FoodMenu {
  String? id;
  String? food_code;
  String? branch_id;
  String? week;
  String? day;
  String? meal_type;
  String? food_title;
  String? food_image;
  String? note;
  String? status;
  String? uploader_info;
  String? data;
  FoodMenu({
    this.id,
    this.food_code,
    this.branch_id,
    this.week,
    this.day,
    this.meal_type,
    this.food_title,
    this.food_image,
    this.note,
    this.status,
    this.uploader_info,
    this.data,
  });

  FoodMenu copyWith({
    String? id,
    String? food_code,
    String? branch_id,
    String? week,
    String? day,
    String? meal_type,
    String? food_title,
    String? food_image,
    String? note,
    String? status,
    String? uploader_info,
    String? data,
  }) {
    return FoodMenu(
      id: id ?? this.id,
      food_code: food_code ?? this.food_code,
      branch_id: branch_id ?? this.branch_id,
      week: week ?? this.week,
      day: day ?? this.day,
      meal_type: meal_type ?? this.meal_type,
      food_title: food_title ?? this.food_title,
      food_image: food_image ?? this.food_image,
      note: note ?? this.note,
      status: status ?? this.status,
      uploader_info: uploader_info ?? this.uploader_info,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'food_code': food_code,
      'branch_id': branch_id,
      'week': week,
      'day': day,
      'meal_type': meal_type,
      'food_title': food_title,
      'food_image': food_image,
      'note': note,
      'status': status,
      'uploader_info': uploader_info,
      'data': data,
    };
  }

  factory FoodMenu.fromMap(Map<String, dynamic> map) {
    return FoodMenu(
      id: map['id'],
      food_code: map['food_code'],
      branch_id: map['branch_id'],
      week: map['week'],
      day: map['day'],
      meal_type: map['meal_type'],
      food_title: map['food_title'],
      food_image: map['food_image'],
      note: map['note'],
      status: map['status'],
      uploader_info: map['uploader_info'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodMenu.fromJson(String source) =>
      FoodMenu.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FoodMenu(id: $id, food_code: $food_code, branch_id: $branch_id, week: $week, day: $day, meal_type: $meal_type, food_title: $food_title, food_image: $food_image, note: $note, status: $status, uploader_info: $uploader_info, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodMenu &&
        other.id == id &&
        other.food_code == food_code &&
        other.branch_id == branch_id &&
        other.week == week &&
        other.day == day &&
        other.meal_type == meal_type &&
        other.food_title == food_title &&
        other.food_image == food_image &&
        other.note == note &&
        other.status == status &&
        other.uploader_info == uploader_info &&
        other.data == data;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        food_code.hashCode ^
        branch_id.hashCode ^
        week.hashCode ^
        day.hashCode ^
        meal_type.hashCode ^
        food_title.hashCode ^
        food_image.hashCode ^
        note.hashCode ^
        status.hashCode ^
        uploader_info.hashCode ^
        data.hashCode;
  }
}
