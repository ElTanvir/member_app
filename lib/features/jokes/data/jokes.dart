import 'dart:convert';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class Jokes {
  String type;
  String? setup;
  String? delivery;
  String? joke;

  Jokes({
    required this.type,
    this.setup,
    this.delivery,
    this.joke,
  });

  Jokes copyWith({
    String? type,
    String? setup,
    String? delivery,
    String? joke,
  }) {
    return Jokes(
      type: type ?? this.type,
      setup: setup ?? this.setup,
      delivery: delivery ?? this.delivery,
      joke: joke ?? this.joke,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'setup': setup,
      'delivery': delivery,
      'joke': joke,
    };
  }

  factory Jokes.fromMap(Map<String, dynamic> map) {
    return Jokes(
      type: map['type'] ?? '',
      setup: map['setup'],
      delivery: map['delivery'],
      joke: map['joke'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Jokes.fromJson(String source) => Jokes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Jokes(type: $type, setup: $setup, delivery: $delivery, joke: $joke)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Jokes &&
        other.type == type &&
        other.setup == setup &&
        other.delivery == delivery &&
        other.joke == joke;
  }

  @override
  int get hashCode {
    return type.hashCode ^ setup.hashCode ^ delivery.hashCode ^ joke.hashCode;
  }
}
