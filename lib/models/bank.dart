import 'package:account_book/services/database.dart';
import 'package:flutter/material.dart';

class Bank {
  int bankId;
  String name;
  String branchName;

  Bank({this.bankId, @required this.name, @required this.branchName});

  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["name"] = name;
    map["branch_name"] = branchName;
    return map;
  }

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["bank_id"] = bankId;
    map["name"] = name;
    map["branch_name"] = branchName;
    return map;
  }

  factory Bank.fromMap(Map<String, dynamic> data) {
    return Bank(
      bankId: data['bank_id'],
      name: data['name'],
      branchName: data['branch_name'],
    );
  }
}

class BankMgr extends ChangeNotifier {
  DatabaseHelper dbInstance = DatabaseHelper();

  Future<int> createBank(String name, String branchName) async{
    final bank = Bank(name: name, branchName: branchName);
    int id = await dbInstance.db.insert("bank", bank.toMapWithoutId());
    return id;
  }
}