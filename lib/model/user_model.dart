// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.idcard,
    this.email,
    this.address,
  });

  int? id;
  String? firstname;
  String? lastname;
  String? phone;
  String? idcard;
  String? email;
  Address? address;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        idcard: json["idcard"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "idcard": idcard,
        "email": email,
        "address": address!.toJson(),
      };
}

class Address {
  Address({
    this.housenumber,
    this.moo,
    this.subdistrict,
    this.district,
    this.province,
  });

  String? housenumber;
  String? moo;
  String? subdistrict;
  String? district;
  String? province;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        housenumber: json["housenumber"],
        moo: json["moo"],
        subdistrict: json["subdistrict"],
        district: json["district"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "housenumber": housenumber,
        "moo": moo,
        "subdistrict": subdistrict,
        "district": district,
        "province": province,
      };
}
