import 'dart:convert';

// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable, avoid_dynamic_calls
class GalleryImageModel {
  int id;
  String file_path;
  GalleryImageModel({
    required this.id,
    required this.file_path,
  });

  GalleryImageModel copyWith({
    int? id,
    String? file_path,
  }) {
    return GalleryImageModel(
      id: id ?? this.id,
      file_path: file_path ?? this.file_path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'file_path': file_path,
    };
  }

  factory GalleryImageModel.fromMap(Map<String, dynamic> map) {
    return GalleryImageModel(
      id: map['id']?.toInt() ?? 0,
      file_path: map['file_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryImageModel.fromJson(String source) =>
      GalleryImageModel.fromMap(json.decode(source));

  @override
  String toString() => 'GalleryImageModel(id: $id, file_path: $file_path)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GalleryImageModel &&
        other.id == id &&
        other.file_path == file_path;
  }

  @override
  int get hashCode => id.hashCode ^ file_path.hashCode;
}
