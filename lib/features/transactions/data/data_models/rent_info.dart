import 'dart:convert';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class RentInfo {
  int id;
  String? booking_id;
  String? transaction_id;
  String? package_category;
  String? package;
  String? recharge_days;
  String? rental_month;
  String? parking;
  String? electricity;
  String? tea_coffee;
  String? penalty;
  String? locker;
  String? card_amount;
  int? rent_amount;
  int? total_amount;
  int? status;
  RentInfo({
    required this.id,
    this.booking_id,
    this.transaction_id,
    this.package_category,
    this.package,
    this.recharge_days,
    this.rental_month,
    this.parking,
    this.electricity,
    this.tea_coffee,
    this.penalty,
    this.locker,
    this.card_amount,
    this.rent_amount,
    this.total_amount,
    this.status,
  });

  RentInfo copyWith({
    int? id,
    String? booking_id,
    String? transaction_id,
    String? package_category,
    String? package,
    String? recharge_days,
    String? rental_month,
    String? parking,
    String? electricity,
    String? tea_coffee,
    String? penalty,
    String? locker,
    String? card_amount,
    int? rent_amount,
    int? total_amount,
    int? status,
  }) {
    return RentInfo(
      id: id ?? this.id,
      booking_id: booking_id ?? this.booking_id,
      transaction_id: transaction_id ?? this.transaction_id,
      package_category: package_category ?? this.package_category,
      package: package ?? this.package,
      recharge_days: recharge_days ?? this.recharge_days,
      rental_month: rental_month ?? this.rental_month,
      parking: parking ?? this.parking,
      electricity: electricity ?? this.electricity,
      tea_coffee: tea_coffee ?? this.tea_coffee,
      penalty: penalty ?? this.penalty,
      locker: locker ?? this.locker,
      card_amount: card_amount ?? this.card_amount,
      rent_amount: rent_amount ?? this.rent_amount,
      total_amount: total_amount ?? this.total_amount,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'booking_id': booking_id,
      'transaction_id': transaction_id,
      'package_category': package_category,
      'package': package,
      'recharge_days': recharge_days,
      'rental_month': rental_month,
      'parking': parking,
      'electricity': electricity,
      'tea_coffee': tea_coffee,
      'penalty': penalty,
      'locker': locker,
      'card_amount': card_amount,
      'rent_amount': rent_amount,
      'total_amount': total_amount,
      'status': status,
    };
  }

  factory RentInfo.fromMap(Map<String, dynamic> map) {
    return RentInfo(
      id: map['id']?.toInt() ?? 0,
      booking_id: map['booking_id'],
      transaction_id: map['transaction_id'],
      package_category: map['package_category'],
      package: map['package'],
      recharge_days: map['recharge_days'],
      rental_month: map['rental_month'],
      parking: map['parking'],
      electricity: map['electricity'],
      tea_coffee: map['tea_coffee'],
      penalty: map['penalty'],
      locker: map['locker'],
      card_amount: map['card_amount'],
      rent_amount: map['rent_amount']?.toInt(),
      total_amount: map['total_amount']?.toInt(),
      status: map['status']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RentInfo.fromJson(String source) =>
      RentInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RentInfo(id: $id, booking_id: $booking_id, transaction_id: $transaction_id, package_category: $package_category, package: $package, recharge_days: $recharge_days, rental_month: $rental_month, parking: $parking, electricity: $electricity, tea_coffee: $tea_coffee, penalty: $penalty, locker: $locker, card_amount: $card_amount, rent_amount: $rent_amount, total_amount: $total_amount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RentInfo &&
        other.id == id &&
        other.booking_id == booking_id &&
        other.transaction_id == transaction_id &&
        other.package_category == package_category &&
        other.package == package &&
        other.recharge_days == recharge_days &&
        other.rental_month == rental_month &&
        other.parking == parking &&
        other.electricity == electricity &&
        other.tea_coffee == tea_coffee &&
        other.penalty == penalty &&
        other.locker == locker &&
        other.card_amount == card_amount &&
        other.rent_amount == rent_amount &&
        other.total_amount == total_amount &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        booking_id.hashCode ^
        transaction_id.hashCode ^
        package_category.hashCode ^
        package.hashCode ^
        recharge_days.hashCode ^
        rental_month.hashCode ^
        parking.hashCode ^
        electricity.hashCode ^
        tea_coffee.hashCode ^
        penalty.hashCode ^
        locker.hashCode ^
        card_amount.hashCode ^
        rent_amount.hashCode ^
        total_amount.hashCode ^
        status.hashCode;
  }
}
