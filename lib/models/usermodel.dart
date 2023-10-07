import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
//
List<UserModel> userModelFromJson(dynamic str) => List<UserModel>.from(
    (str).map(
          (x)=>UserModel.fromJson(x),
    ));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class UserModel {

  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String gender;
  final bool vegan;
  final String phone;
  final String dob;
  final String address;
  final String password;
  final String expires;


  UserModel({required this.id, required this.firstname, required this.lastname, required this.email, required this.gender, required this.vegan,
    required this.phone, required this.dob, required this.address, required this.password,required this.expires});

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      id: json['_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      gender: json['gender'],
      vegan: json['vegan'],
      phone: json['phone'],
      dob: json['dob'],
      address: json['address'],
      password: json['password'],
      expires: json['expires'],
    );
  }

  factory UserModel.fromMap(Map<String,dynamic> json){
    return UserModel(
      id: json['_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      gender: json['gender'],
      vegan: json['vegan'],
      phone: json['phone'],
      dob: json['dob'],
      address: json['address'],
      password: json['password'],
      expires: json['expires'],
    );
  }


  Map<String, dynamic> toJson() =>
      {
        "_id": id,
        "firstname": firstname,
        "lastname":lastname,
        "email":email,
        "gender": gender,
        "vegan":vegan,
        "phone":phone,
        "bob":dob,
        "address":address,
        "password":password,
        "expires":expires,
      };





}