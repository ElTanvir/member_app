import 'dart:convert';
// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class RentInfo {
  String? id;
  String? booking_id;
  String? branch_id;
  String? branch_name;
  String? checkin_date;
  String? checkout_date;
  String? package_category;
  String? package_category_name;
  String? package;
  String? package_name;
  String? card_no;
  String? m_name;
  String? rent_amount;
  String? parking;
  String? electricity;
  String? tea_coffee;
  String? total_amount;
  String? penalty;
  String? locker;
  String? card_p_amount;
  String? recharge_days;
  String? rent_status;
  String? payment_pattern;
  String? notification_member;
  String? notification_loby;
  String? payment_method;
  String? data_one;
  String? data_two;
  String? data_three;
  String? note;
  String? remarks;
  String? status;
  String? uploader_info;
  String? month_name;
  String? data;
  String? dis_aamt;
  String? discount_pattern;
  String? discount_money;
  RentInfo({
    this.id,
    this.booking_id,
    this.branch_id,
    this.branch_name,
    this.checkin_date,
    this.checkout_date,
    this.package_category,
    this.package_category_name,
    this.package,
    this.package_name,
    this.card_no,
    this.m_name,
    this.rent_amount,
    this.parking,
    this.electricity,
    this.tea_coffee,
    this.total_amount,
    this.penalty,
    this.locker,
    this.card_p_amount,
    this.recharge_days,
    this.rent_status,
    this.payment_pattern,
    this.notification_member,
    this.notification_loby,
    this.payment_method,
    this.data_one,
    this.data_two,
    this.data_three,
    this.note,
    this.remarks,
    this.status,
    this.uploader_info,
    this.month_name,
    this.data,
    this.dis_aamt,
    this.discount_pattern,
    this.discount_money,
  });

  RentInfo copyWith({
    String? id,
    String? booking_id,
    String? branch_id,
    String? branch_name,
    String? checkin_date,
    String? checkout_date,
    String? package_category,
    String? package_category_name,
    String? package,
    String? package_name,
    String? card_no,
    String? m_name,
    String? rent_amount,
    String? parking,
    String? electricity,
    String? tea_coffee,
    String? total_amount,
    String? penalty,
    String? locker,
    String? card_p_amount,
    String? recharge_days,
    String? rent_status,
    String? payment_pattern,
    String? notification_member,
    String? notification_loby,
    String? payment_method,
    String? data_one,
    String? data_two,
    String? data_three,
    String? note,
    String? remarks,
    String? status,
    String? uploader_info,
    String? month_name,
    String? data,
    String? dis_aamt,
    String? discount_pattern,
    String? discount_money,
  }) {
    return RentInfo(
      id: id ?? this.id,
      booking_id: booking_id ?? this.booking_id,
      branch_id: branch_id ?? this.branch_id,
      branch_name: branch_name ?? this.branch_name,
      checkin_date: checkin_date ?? this.checkin_date,
      checkout_date: checkout_date ?? this.checkout_date,
      package_category: package_category ?? this.package_category,
      package_category_name:
          package_category_name ?? this.package_category_name,
      package: package ?? this.package,
      package_name: package_name ?? this.package_name,
      card_no: card_no ?? this.card_no,
      m_name: m_name ?? this.m_name,
      rent_amount: rent_amount ?? this.rent_amount,
      parking: parking ?? this.parking,
      electricity: electricity ?? this.electricity,
      tea_coffee: tea_coffee ?? this.tea_coffee,
      total_amount: total_amount ?? this.total_amount,
      penalty: penalty ?? this.penalty,
      locker: locker ?? this.locker,
      card_p_amount: card_p_amount ?? this.card_p_amount,
      recharge_days: recharge_days ?? this.recharge_days,
      rent_status: rent_status ?? this.rent_status,
      payment_pattern: payment_pattern ?? this.payment_pattern,
      notification_member: notification_member ?? this.notification_member,
      notification_loby: notification_loby ?? this.notification_loby,
      payment_method: payment_method ?? this.payment_method,
      data_one: data_one ?? this.data_one,
      data_two: data_two ?? this.data_two,
      data_three: data_three ?? this.data_three,
      note: note ?? this.note,
      remarks: remarks ?? this.remarks,
      status: status ?? this.status,
      uploader_info: uploader_info ?? this.uploader_info,
      month_name: month_name ?? this.month_name,
      data: data ?? this.data,
      dis_aamt: dis_aamt ?? this.dis_aamt,
      discount_pattern: discount_pattern ?? this.discount_pattern,
      discount_money: discount_money ?? this.discount_money,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'booking_id': booking_id,
      'branch_id': branch_id,
      'branch_name': branch_name,
      'checkin_date': checkin_date,
      'checkout_date': checkout_date,
      'package_category': package_category,
      'package_category_name': package_category_name,
      'package': package,
      'package_name': package_name,
      'card_no': card_no,
      'm_name': m_name,
      'rent_amount': rent_amount,
      'parking': parking,
      'electricity': electricity,
      'tea_coffee': tea_coffee,
      'total_amount': total_amount,
      'penalty': penalty,
      'locker': locker,
      'card_p_amount': card_p_amount,
      'recharge_days': recharge_days,
      'rent_status': rent_status,
      'payment_pattern': payment_pattern,
      'notification_member': notification_member,
      'notification_loby': notification_loby,
      'payment_method': payment_method,
      'data_one': data_one,
      'data_two': data_two,
      'data_three': data_three,
      'note': note,
      'remarks': remarks,
      'status': status,
      'uploader_info': uploader_info,
      'month_name': month_name,
      'data': data,
      'dis_aamt': dis_aamt,
      'discount_pattern': discount_pattern,
      'discount_money': discount_money,
    };
  }

  factory RentInfo.fromMap(Map<String, dynamic> map) {
    return RentInfo(
      id: map['id'],
      booking_id: map['booking_id'],
      branch_id: map['branch_id'],
      branch_name: map['branch_name'],
      checkin_date: map['checkin_date'],
      checkout_date: map['checkout_date'],
      package_category: map['package_category'],
      package_category_name: map['package_category_name'],
      package: map['package'],
      package_name: map['package_name'],
      card_no: map['card_no'],
      m_name: map['m_name'],
      rent_amount: map['rent_amount'],
      parking: map['parking'],
      electricity: map['electricity'],
      tea_coffee: map['tea_coffee'],
      total_amount: map['total_amount'],
      penalty: map['penalty'],
      locker: map['locker'],
      card_p_amount: map['card_p_amount'],
      recharge_days: map['recharge_days'],
      rent_status: map['rent_status'],
      payment_pattern: map['payment_pattern'],
      notification_member: map['notification_member'],
      notification_loby: map['notification_loby'],
      payment_method: map['payment_method'],
      data_one: map['data_one'],
      data_two: map['data_two'],
      data_three: map['data_three'],
      note: map['note'],
      remarks: map['remarks'],
      status: map['status'],
      uploader_info: map['uploader_info'],
      month_name: map['month_name'],
      data: map['data'],
      dis_aamt: map['dis_aamt'],
      discount_pattern: map['discount_pattern'],
      discount_money: map['discount_money'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RentInfo.fromJson(String source) =>
      RentInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RentInfo(id: $id, booking_id: $booking_id, branch_id: $branch_id, branch_name: $branch_name, checkin_date: $checkin_date, checkout_date: $checkout_date, package_category: $package_category, package_category_name: $package_category_name, package: $package, package_name: $package_name, card_no: $card_no, m_name: $m_name, rent_amount: $rent_amount, parking: $parking, electricity: $electricity, tea_coffee: $tea_coffee, total_amount: $total_amount, penalty: $penalty, locker: $locker, card_p_amount: $card_p_amount, recharge_days: $recharge_days, rent_status: $rent_status, payment_pattern: $payment_pattern, notification_member: $notification_member, notification_loby: $notification_loby, payment_method: $payment_method, data_one: $data_one, data_two: $data_two, data_three: $data_three, note: $note, remarks: $remarks, status: $status, uploader_info: $uploader_info, month_name: $month_name, data: $data, dis_aamt: $dis_aamt, discount_pattern: $discount_pattern, discount_money: $discount_money)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RentInfo &&
        other.id == id &&
        other.booking_id == booking_id &&
        other.branch_id == branch_id &&
        other.branch_name == branch_name &&
        other.checkin_date == checkin_date &&
        other.checkout_date == checkout_date &&
        other.package_category == package_category &&
        other.package_category_name == package_category_name &&
        other.package == package &&
        other.package_name == package_name &&
        other.card_no == card_no &&
        other.m_name == m_name &&
        other.rent_amount == rent_amount &&
        other.parking == parking &&
        other.electricity == electricity &&
        other.tea_coffee == tea_coffee &&
        other.total_amount == total_amount &&
        other.penalty == penalty &&
        other.locker == locker &&
        other.card_p_amount == card_p_amount &&
        other.recharge_days == recharge_days &&
        other.rent_status == rent_status &&
        other.payment_pattern == payment_pattern &&
        other.notification_member == notification_member &&
        other.notification_loby == notification_loby &&
        other.payment_method == payment_method &&
        other.data_one == data_one &&
        other.data_two == data_two &&
        other.data_three == data_three &&
        other.note == note &&
        other.remarks == remarks &&
        other.status == status &&
        other.uploader_info == uploader_info &&
        other.month_name == month_name &&
        other.data == data &&
        other.dis_aamt == dis_aamt &&
        other.discount_pattern == discount_pattern &&
        other.discount_money == discount_money;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        booking_id.hashCode ^
        branch_id.hashCode ^
        branch_name.hashCode ^
        checkin_date.hashCode ^
        checkout_date.hashCode ^
        package_category.hashCode ^
        package_category_name.hashCode ^
        package.hashCode ^
        package_name.hashCode ^
        card_no.hashCode ^
        m_name.hashCode ^
        rent_amount.hashCode ^
        parking.hashCode ^
        electricity.hashCode ^
        tea_coffee.hashCode ^
        total_amount.hashCode ^
        penalty.hashCode ^
        locker.hashCode ^
        card_p_amount.hashCode ^
        recharge_days.hashCode ^
        rent_status.hashCode ^
        payment_pattern.hashCode ^
        notification_member.hashCode ^
        notification_loby.hashCode ^
        payment_method.hashCode ^
        data_one.hashCode ^
        data_two.hashCode ^
        data_three.hashCode ^
        note.hashCode ^
        remarks.hashCode ^
        status.hashCode ^
        uploader_info.hashCode ^
        month_name.hashCode ^
        data.hashCode ^
        dis_aamt.hashCode ^
        discount_pattern.hashCode ^
        discount_money.hashCode;
  }
}
