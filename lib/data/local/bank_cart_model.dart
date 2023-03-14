import 'package:flutter/material.dart';
class BankCardModel {
  final String image;
  final String icon;
  final String number;
  final double balance;

  BankCardModel(
      {required this.image,
      required this.icon,
      required this.number,
      required this.balance});
}

class User {
  final int id;
  final String img;
  final String imgProfile;
  final String name;
  final String surName;
  final bool status;

  User(
      {required this.id,
        required this.img,
        required this.imgProfile,
        required this.name,
        required this.surName,
        required this.status});

  static List<User> listUser = [
    User(
        id: 12,
        img: "assets/images/11.png",
        imgProfile: "",
        name: "a1",
        surName: "b1",
        status: true),
    User(
        id: 13,
        img: "assets/images/12.jpg",
        imgProfile: "",
        name: "a2",
        surName: "b2",
        status: true),
    User(
        id: 14,
        img: "assets/images/13.png",
        imgProfile: "",
        name: "a3",
        surName: "b3",
        status: true),
    User(
        id: 15,
        img: "assets/images/14.jpg",
        imgProfile: "",
        name: "a4",
        surName: "b4",
        status: true),
    User(
        id: 16,
        img: "assets/images/15.png",
        imgProfile: "",
        name: "a5",
        surName: "b5",
        status: true),
    User(
        id: 17,
        img: "assets/images/16.jpg",
        imgProfile: "",
        name: "a5",
        surName: "b5",
        status: true),

  ];
}



final cards = [
  null,
  BankCardModel(
      image: "assets/images/1.jpg",
      icon: "1.jpg",
      number: "09212",
      balance: 12.2),
  BankCardModel(
      image: "assets/images/2.jpg",
      icon: "2.jpg",
      number: "09212",
      balance: 34.2),
  BankCardModel(
      image: "assets/images/3.jpg",
      icon: "3.jpg",
      number: "09212",
      balance: 132.3),
  BankCardModel(
      image: "assets/images/4.jpg",
      icon: "4.jpg",
      number: "09212",
      balance: 23.27),
  BankCardModel(
      image: "assets/images/5.png",
      icon: "5.png",
      number: "09212",
      balance: 12.32),
  BankCardModel(
      image: "assets/images/6.jpg",
      icon: "6.jpg",
      number: "09212",
      balance: 23.2),
  BankCardModel(
      image: "assets/images/7.jpg",
      icon: "7.jpg",
      number: "09212",
      balance: 162.82),
];
