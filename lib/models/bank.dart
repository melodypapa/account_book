import 'package:account_book/services/database.dart';
import 'package:flutter/material.dart';

class Bank {
  int bankId;
  String name;
  int createdAt;

  Bank({this.bankId, @required this.name, @required this.createdAt});

  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["name"] = name;
    map["created_at"] = createdAt;
    return map;
  }

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["bank_id"] = bankId;
    map["name"] = name;
    map["created_at"] = createdAt;
    return map;
  }

  factory Bank.fromMap(Map<String, dynamic> data) {
    return Bank(
      bankId: data['bank_id'],
      name: data['name'],
      createdAt: data['created_at'],
    );
  }

  @override
  String toString() {
    return "Bank: $name";
  }
}