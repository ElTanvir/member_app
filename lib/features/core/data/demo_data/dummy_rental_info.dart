// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

import 'dart:convert';

class DummyRentalInfo {
  String? payment_date;
  String? package;
  String? rent_amount;
  String? recharge_days;
  String? status;
  String? rental_month;
  String? view;
  DummyRentalInfo({
    this.payment_date,
    this.package,
    this.rent_amount,
    this.recharge_days,
    this.status,
    this.rental_month,
    this.view,
  });

  DummyRentalInfo copyWith({
    String? payment_date,
    String? package,
    String? rent_amount,
    String? recharge_days,
    String? status,
    String? rental_month,
    String? view,
  }) {
    return DummyRentalInfo(
      payment_date: payment_date ?? this.payment_date,
      package: package ?? this.package,
      rent_amount: rent_amount ?? this.rent_amount,
      recharge_days: recharge_days ?? this.recharge_days,
      status: status ?? this.status,
      rental_month: rental_month ?? this.rental_month,
      view: view ?? this.view,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'payment_date': payment_date,
      'package': package,
      'rent_amount': rent_amount,
      'recharge_days': recharge_days,
      'status': status,
      'rental_month': rental_month,
      'view': view,
    };
  }

  factory DummyRentalInfo.fromMap(Map<String, dynamic> map) {
    return DummyRentalInfo(
      payment_date: map['payment_date'],
      package: map['package'],
      rent_amount: map['rent_amount'],
      recharge_days: map['recharge_days'],
      status: map['status'],
      rental_month: map['rental_month'],
      view: map['view'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DummyRentalInfo.fromJson(String source) =>
      DummyRentalInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DummyRentalInfo(payment_date: $payment_date, package: $package, rent_amount: $rent_amount, recharge_days: $recharge_days, status: $status, rental_month: $rental_month, view: $view)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DummyRentalInfo &&
        other.payment_date == payment_date &&
        other.package == package &&
        other.rent_amount == rent_amount &&
        other.recharge_days == recharge_days &&
        other.status == status &&
        other.rental_month == rental_month &&
        other.view == view;
  }

  @override
  int get hashCode {
    return payment_date.hashCode ^
        package.hashCode ^
        rent_amount.hashCode ^
        recharge_days.hashCode ^
        status.hashCode ^
        rental_month.hashCode ^
        view.hashCode;
  }
}

List<DummyRentalInfo> dummyRenTalInfo = [
  DummyRentalInfo(
    payment_date: '10/12/2021',
    package: 'Diamond',
    rent_amount: 'BDT 9,999',
    recharge_days: '31 Days',
    status: 'Paid',
    rental_month: 'December',
    view: '',
  ),
  DummyRentalInfo(
    payment_date: '10/11/2021',
    package: 'Diamond',
    rent_amount: 'BDT 9,999',
    recharge_days: '30 Days',
    status: 'Paid',
    rental_month: 'November',
    view: '',
  ),
  DummyRentalInfo(
    payment_date: '10/10/2021',
    package: 'Diamond',
    rent_amount: 'BDT 9,999',
    recharge_days: '31 Days',
    status: 'Paid',
    rental_month: 'October',
    view: '',
  ),
  DummyRentalInfo(
    payment_date: '10/09/2021',
    package: 'Diamond',
    rent_amount: 'BDT 9,999',
    recharge_days: '30 Days',
    status: 'Paid',
    rental_month: 'September',
    view: '',
  ),
];
