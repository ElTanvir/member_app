import 'dart:convert';

// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable

class MealDataModel {
  String? id;
  String? branch_id;
  String? booking_id;
  String? card_number;
  String? days;
  String? dats;
  String? month;
  String? year;
  String? minute;
  String? hour;
  String? am_pm;
  String? time;
  String? data;
  String? breakfast;
  String? lunch;
  String? dinner;
  String? request;
  String? note;
  String? status;
  String? uploader_info;
  MealDataModel({
    this.id,
    this.branch_id,
    this.booking_id,
    this.card_number,
    this.days,
    this.dats,
    this.month,
    this.year,
    this.minute,
    this.hour,
    this.am_pm,
    this.time,
    this.data,
    this.breakfast,
    this.lunch,
    this.dinner,
    this.request,
    this.note,
    this.status,
    this.uploader_info,
  });

  MealDataModel copyWith({
    String? id,
    String? branch_id,
    String? booking_id,
    String? card_number,
    String? days,
    String? dats,
    String? month,
    String? year,
    String? minute,
    String? hour,
    String? am_pm,
    String? time,
    String? data,
    String? breakfast,
    String? lunch,
    String? dinner,
    String? request,
    String? note,
    String? status,
    String? uploader_info,
  }) {
    return MealDataModel(
      id: id ?? this.id,
      branch_id: branch_id ?? this.branch_id,
      booking_id: booking_id ?? this.booking_id,
      card_number: card_number ?? this.card_number,
      days: days ?? this.days,
      dats: dats ?? this.dats,
      month: month ?? this.month,
      year: year ?? this.year,
      minute: minute ?? this.minute,
      hour: hour ?? this.hour,
      am_pm: am_pm ?? this.am_pm,
      time: time ?? this.time,
      data: data ?? this.data,
      breakfast: breakfast ?? this.breakfast,
      lunch: lunch ?? this.lunch,
      dinner: dinner ?? this.dinner,
      request: request ?? this.request,
      note: note ?? this.note,
      status: status ?? this.status,
      uploader_info: uploader_info ?? this.uploader_info,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'branch_id': branch_id,
      'booking_id': booking_id,
      'card_number': card_number,
      'days': days,
      'dats': dats,
      'month': month,
      'year': year,
      'minute': minute,
      'hour': hour,
      'am_pm': am_pm,
      'time': time,
      'data': data,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'request': request,
      'note': note,
      'status': status,
      'uploader_info': uploader_info,
    };
  }

  factory MealDataModel.fromMap(Map<String, dynamic> map) {
    return MealDataModel(
      id: map['id'],
      branch_id: map['branch_id'],
      booking_id: map['booking_id'],
      card_number: map['card_number'],
      days: map['days'],
      dats: map['dats'],
      month: map['month'],
      year: map['year'],
      minute: map['minute'],
      hour: map['hour'],
      am_pm: map['am_pm'],
      time: map['time'],
      data: map['data'],
      breakfast: map['breakfast'],
      lunch: map['lunch'],
      dinner: map['dinner'],
      request: map['request'],
      note: map['note'],
      status: map['status'],
      uploader_info: map['uploader_info'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MealDataModel.fromJson(String source) =>
      MealDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MealDataModel(id: $id, branch_id: $branch_id, booking_id: $booking_id, card_number: $card_number, days: $days, dats: $dats, month: $month, year: $year, minute: $minute, hour: $hour, am_pm: $am_pm, time: $time, data: $data, breakfast: $breakfast, lunch: $lunch, dinner: $dinner, request: $request, note: $note, status: $status, uploader_info: $uploader_info)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MealDataModel &&
        other.id == id &&
        other.branch_id == branch_id &&
        other.booking_id == booking_id &&
        other.card_number == card_number &&
        other.days == days &&
        other.dats == dats &&
        other.month == month &&
        other.year == year &&
        other.minute == minute &&
        other.hour == hour &&
        other.am_pm == am_pm &&
        other.time == time &&
        other.data == data &&
        other.breakfast == breakfast &&
        other.lunch == lunch &&
        other.dinner == dinner &&
        other.request == request &&
        other.note == note &&
        other.status == status &&
        other.uploader_info == uploader_info;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        branch_id.hashCode ^
        booking_id.hashCode ^
        card_number.hashCode ^
        days.hashCode ^
        dats.hashCode ^
        month.hashCode ^
        year.hashCode ^
        minute.hashCode ^
        hour.hashCode ^
        am_pm.hashCode ^
        time.hashCode ^
        data.hashCode ^
        breakfast.hashCode ^
        lunch.hashCode ^
        dinner.hashCode ^
        request.hashCode ^
        note.hashCode ^
        status.hashCode ^
        uploader_info.hashCode;
  }
}
