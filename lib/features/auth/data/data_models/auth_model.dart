import 'dart:convert';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class AuthModel {
  String token;
  AuthModel({
    required this.token,
  });

  AuthModel copyWith({
    String? token,
  }) {
    return AuthModel(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));

  @override
  String toString() => 'AuthModel(token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthModel && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
