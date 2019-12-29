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
    _currentBankId = 0;
  }

  void loadBankOptions() async{
    print(_dbInsance.db);
    /*List<Map> maps = await _dbInsance.db.query(DatabaseHelper.tableBank, columns: ["bank_id", "name"]);

    if (maps.length > 0){
      _bankOptions = [];
      maps.forEach((item){
        _bankOptions.add(Bank.fromMap(item));
      });
      if (currentBankId == 0){
        currentBankId = _bankOptions[0].bankId;
      }
      notifyListeners();
    }*/
  }
}