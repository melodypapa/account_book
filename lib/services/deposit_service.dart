import 'package:account_book/models/models.dart';
import 'package:account_book/services/database.dart';
import 'package:flutter/material.dart';


class DepositService extends ChangeNotifier {
  final DatabaseHelper _dbInsance = DatabaseHelper();
  int _currentBankId;
  List<Bank> _bankOptions;

  List<Bank> get bankOptions => _bankOptions;

  int get currentBankId => _currentBankId;

  set currentBankId(int bankId){
    _currentBankId = bankId;
    notifyListeners();
  }

  DepositService(){
    _bankOptions = [];
  }

  void loadBankOptions() async{
    List<Map> maps = await _dbInsance.db.query(DatabaseHelper.tableBank, columns: ["bank_id", "name"]);

    if (maps != null){
      _bankOptions = [];
      maps.forEach((item){
        _bankOptions.add(Bank.fromMap(item));
      });
      notifyListeners();
    }
  }
}