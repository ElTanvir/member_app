import 'dart:convert';

// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class RefreshmentItemModeldown {
  String item_name;
  String item_picture;
  int price;
  RefreshmentItemModeldown({
    required this.item_name,
    required this.item_picture,
    required this.price,
  });

  RefreshmentItemModeldown copyWith({
    String? item_name,
    String? item_picture,
    int? price,
  }) {
    return RefreshmentItemModeldown(
      item_name: item_name ?? this.item_name,
      item_picture: item_picture ?? this.item_picture,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item_name': item_name,
      'item_picture': item_picture,
      'price': price,
    };
  }

  factory RefreshmentItemModeldown.fromMap(Map<String, dynamic> map) {
    return RefreshmentItemModeldown(
      item_name: map['item_name'] ?? '',
      item_picture: map['item_picture'] ?? '',
      price: map['price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshmentItemModeldown.fromJson(String source) =>
      RefreshmentItemModeldown.fromMap(json.decode(source));

  @override
  String toString() =>
      'RefreshmentItemModeldown(item_name: $item_name, item_picture: $item_picture, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RefreshmentItemModeldown &&
        other.item_name == item_name &&
        other.item_picture == item_picture &&
        other.price == price;
  }

  @override
  int get hashCode =>
      item_name.hashCode ^ item_picture.hashCode ^ price.hashCode;
}
