import 'package:account_book/models/models.dart';
import 'package:account_book/services/database.dart';
import 'package:flutter/material.dart';

class DepositService extends ChangeNotifier {
  final DatabaseInstance dbInstance;
  
  List<Bank> _bankOptions;
  Deposit _currentDeposit;

  int get currentBankId => _currentDeposit.bankId;
  Deposit get currentDeposit => _currentDeposit;

  set currentBankId(int bankId){
    _currentDeposit.bankId = bankId;
    print("bankdId changes to $currentBankId");
    notifyListeners();
  }

  List<Bank> get bankOptions => _bankOptions;

  DepositService({@required this.dbInstance}){
    _bankOptions = [];
    _currentDeposit = Deposit.emptyDeposit();
  }

  void loadBankOptions() async{
    List<Map> maps = await dbInstance.db.query(DatabaseInstance.tableBank, columns: ["bank_id", "name", 'created_at']);

    if (maps.length > 0){
      _bankOptions = [];
      maps.forEach((item){
        _bankOptions.add(Bank.fromMap(item));
      });
      if (currentBankId == 0){
        currentBankId = _bankOptions[0].bankId;
      }
      notifyListeners();
    }
  }
}