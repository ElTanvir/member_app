// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

import 'dart:convert';

class DocumentModel {
  String? document_type;
  String? document_upload;
  DocumentModel({
    this.document_type,
    this.document_upload,
  });

  DocumentModel copyWith({
    String? document_type,
    String? document_upload,
  }) {
    return DocumentModel(
      document_type: document_type ?? this.document_type,
      document_upload: document_upload ?? this.document_upload,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'document_type': document_type,
      'document_upload': document_upload,
    };
  }

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      document_type: map['document_type'],
      document_upload: map['document_upload'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentModel.fromJson(String source) =>
      DocumentModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DocumentModel(document_type: $document_type, document_upload: $document_upload)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DocumentModel &&
        other.document_type == document_type &&
        other.document_upload == document_upload;
  }

  @override
  int get hashCode => document_type.hashCode ^ document_upload.hashCode;
}
