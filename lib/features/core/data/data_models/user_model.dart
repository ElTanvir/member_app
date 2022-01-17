// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names,argument_type_not_assignable, avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:member_app/features/core/data/data_models/document_model.dart';

class UserModel {
  int id;
  String branch_name;
  String floor;
  String unit;
  String room;
  String bed;
  String bet_type;
  String full_name;
  String email;
  String phone_number;
  String occupation;
  String religion;
  String father_name;
  String nid;
  String emergency_number_1;
  String emergency_number_2;
  String booking_date;
  String check_in_date;
  String card_number;
  String check_out_date;
  String package_name;
  String? photo;
  String parking;
  String booked_by;
  int security_deposite;
  List<DocumentModel> documents;
  UserModel({
    required this.id,
    required this.branch_name,
    required this.floor,
    required this.unit,
    required this.room,
    required this.bed,
    required this.bet_type,
    required this.full_name,
    required this.email,
    required this.phone_number,
    required this.occupation,
    required this.religion,
    required this.father_name,
    required this.nid,
    required this.emergency_number_1,
    required this.emergency_number_2,
    required this.booking_date,
    required this.check_in_date,
    required this.card_number,
    required this.check_out_date,
    required this.package_name,
    this.photo,
    required this.parking,
    required this.booked_by,
    required this.security_deposite,
    required this.documents,
  });

  UserModel copyWith({
    int? id,
    String? branch_name,
    String? floor,
    String? unit,
    String? room,
    String? bed,
    String? bet_type,
    String? full_name,
    String? email,
    String? phone_number,
    String? occupation,
    String? religion,
    String? father_name,
    String? nid,
    String? emergency_number_1,
    String? emergency_number_2,
    String? booking_date,
    String? check_in_date,
    String? card_number,
    String? check_out_date,
    String? package_name,
    String? photo,
    String? parking,
    String? booked_by,
    int? security_deposite,
    List<DocumentModel>? documents,
  }) {
    return UserModel(
      id: id ?? this.id,
      branch_name: branch_name ?? this.branch_name,
      floor: floor ?? this.floor,
      unit: unit ?? this.unit,
      room: room ?? this.room,
      bed: bed ?? this.bed,
      bet_type: bet_type ?? this.bet_type,
      full_name: full_name ?? this.full_name,
      email: email ?? this.email,
      phone_number: phone_number ?? this.phone_number,
      occupation: occupation ?? this.occupation,
      religion: religion ?? this.religion,
      father_name: father_name ?? this.father_name,
      nid: nid ?? this.nid,
      emergency_number_1: emergency_number_1 ?? this.emergency_number_1,
      emergency_number_2: emergency_number_2 ?? this.emergency_number_2,
      booking_date: booking_date ?? this.booking_date,
      check_in_date: check_in_date ?? this.check_in_date,
      card_number: card_number ?? this.card_number,
      check_out_date: check_out_date ?? this.check_out_date,
      package_name: package_name ?? this.package_name,
      photo: photo ?? this.photo,
      parking: parking ?? this.parking,
      booked_by: booked_by ?? this.booked_by,
      security_deposite: security_deposite ?? this.security_deposite,
      documents: documents ?? this.documents,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'branch_name': branch_name,
      'floor': floor,
      'unit': unit,
      'room': room,
      'bed': bed,
      'bet_type': bet_type,
      'full_name': full_name,
      'email': email,
      'phone_number': phone_number,
      'occupation': occupation,
      'religion': religion,
      'father_name': father_name,
      'nid': nid,
      'emergency_number_1': emergency_number_1,
      'emergency_number_2': emergency_number_2,
      'booking_date': booking_date,
      'check_in_date': check_in_date,
      'card_number': card_number,
      'check_out_date': check_out_date,
      'package_name': package_name,
      'photo': photo,
      'parking': parking,
      'booked_by': booked_by,
      'security_deposite': security_deposite,
      'documents': documents.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      branch_name: map['branch_name'] ?? '',
      floor: map['floor'] ?? '',
      unit: map['unit'] ?? '',
      room: map['room'] ?? '',
      bed: map['bed'] ?? '',
      bet_type: map['bet_type'] ?? '',
      full_name: map['full_name'] ?? '',
      email: map['email'] ?? '',
      phone_number: map['phone_number'] ?? '',
      occupation: map['occupation'] ?? '',
      religion: map['religion'] ?? '',
      father_name: map['father_name'] ?? '',
      nid: map['nid'] ?? '',
      emergency_number_1: map['emergency_number_1'] ?? '',
      emergency_number_2: map['emergency_number_2'] ?? '',
      booking_date: map['booking_date'] ?? '',
      check_in_date: map['check_in_date'] ?? '',
      card_number: map['card_number'] ?? '',
      check_out_date: map['check_out_date'] ?? '',
      package_name: map['package_name'] ?? '',
      photo: map['photo'],
      parking: map['parking'] ?? '',
      booked_by: map['booked_by'] ?? '',
      security_deposite: map['security_deposite']?.toInt() ?? 0,
      documents: List<DocumentModel>.from(
        map['documents']?.map((x) => DocumentModel.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, branch_name: $branch_name, floor: $floor, unit: $unit, room: $room, bed: $bed, bet_type: $bet_type, full_name: $full_name, email: $email, phone_number: $phone_number, occupation: $occupation, religion: $religion, father_name: $father_name, nid: $nid, emergency_number_1: $emergency_number_1, emergency_number_2: $emergency_number_2, booking_date: $booking_date, check_in_date: $check_in_date, card_number: $card_number, check_out_date: $check_out_date, package_name: $package_name, photo: $photo, parking: $parking, booked_by: $booked_by, security_deposite: $security_deposite, documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.branch_name == branch_name &&
        other.floor == floor &&
        other.unit == unit &&
        other.room == room &&
        other.bed == bed &&
        other.bet_type == bet_type &&
        other.full_name == full_name &&
        other.email == email &&
        other.phone_number == phone_number &&
        other.occupation == occupation &&
        other.religion == religion &&
        other.father_name == father_name &&
        other.nid == nid &&
        other.emergency_number_1 == emergency_number_1 &&
        other.emergency_number_2 == emergency_number_2 &&
        other.booking_date == booking_date &&
        other.check_in_date == check_in_date &&
        other.card_number == card_number &&
        other.check_out_date == check_out_date &&
        other.package_name == package_name &&
        other.photo == photo &&
        other.parking == parking &&
        other.booked_by == booked_by &&
        other.security_deposite == security_deposite &&
        listEquals(other.documents, documents);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        branch_name.hashCode ^
        floor.hashCode ^
        unit.hashCode ^
        room.hashCode ^
        bed.hashCode ^
        bet_type.hashCode ^
        full_name.hashCode ^
        email.hashCode ^
        phone_number.hashCode ^
        occupation.hashCode ^
        religion.hashCode ^
        father_name.hashCode ^
        nid.hashCode ^
        emergency_number_1.hashCode ^
        emergency_number_2.hashCode ^
        booking_date.hashCode ^
        check_in_date.hashCode ^
        card_number.hashCode ^
        check_out_date.hashCode ^
        package_name.hashCode ^
        photo.hashCode ^
        parking.hashCode ^
        booked_by.hashCode ^
        security_deposite.hashCode ^
        documents.hashCode;
  }
}
