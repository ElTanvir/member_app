import 'dart:convert';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class RentInfo {
  int id;
  String date;
  String package_name;
  String rent_amount;
  String recharge_days;
  String rental_month;
  String rent_status;
  RentInfo({
    required this.id,
    required this.date,
    required this.package_name,
    required this.rent_amount,
    required this.recharge_days,
    required this.rental_month,
    required this.rent_status,
  });

  RentInfo copyWith({
    int? id,
    String? date,
    String? package_name,
    String? rent_amount,
    String? recharge_days,
    String? rental_month,
    String? rent_status,
  }) {
    return RentInfo(
      id: id ?? this.id,
      date: date ?? this.date,
      package_name: package_name ?? this.package_name,
      rent_amount: rent_amount ?? this.rent_amount,
      recharge_days: recharge_days ?? this.recharge_days,
      rental_month: rental_month ?? this.rental_month,
      rent_status: rent_status ?? this.rent_status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'package_name': package_name,
      'rent_amount': rent_amount,
      'recharge_days': recharge_days,
      'rental_month': rental_month,
      'rent_status': rent_status,
    };
  }

  factory RentInfo.fromMap(Map<String, dynamic> map) {
    return RentInfo(
      // ignore: avoid_dynamic_calls
      id: map['id']?.toInt() ?? 0,
      date: map['date'] ?? '',
      package_name: map['package_name'] ?? '',
      rent_amount: map['rent_amount'] ?? '',
      recharge_days: map['recharge_days'] ?? '',
      rental_month: map['rental_month'] ?? '',
      rent_status: map['rent_status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RentInfo.fromJson(String source) =>
      RentInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RentInfo(id: $id, date: $date, package_name: $package_name, rent_amount: $rent_amount, recharge_days: $recharge_days, rental_month: $rental_month, rent_status: $rent_status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RentInfo &&
        other.id == id &&
        other.date == date &&
        other.package_name == package_name &&
        other.rent_amount == rent_amount &&
        other.recharge_days == recharge_days &&
        other.rental_month == rental_month &&
        other.rent_status == rent_status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        package_name.hashCode ^
        rent_amount.hashCode ^
        recharge_days.hashCode ^
        rental_month.hashCode ^
        rent_status.hashCode;
  }
}
