import 'package:flutter/foundation.dart';

class Deposit {
  int depositId;
  int bankId;
  double amount;
  DateTime startDate;
  int month;
  double interest;
  DateTime createdAt;

  Deposit({
    this.depositId,
    @required bankId,
    @required amount,
    @required startDate,
    @required month,
    @required interest,
    @required createdAt,
  });

  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["bank_id"] = bankId;
    map['amount'] = amount;
    map['start_date'] = startDate.microsecondsSinceEpoch;
    map['month'] = month;
    map['interest'] = interest;
    map["created_at"] = createdAt.microsecondsSinceEpoch;
    return map;
  }

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map['deposit_id'] = depositId;
    map["bank_id"] = bankId;
    map['amount'] = amount;
    map['start_date'] = startDate.microsecondsSinceEpoch;
    map['month'] = month;
    map['interest'] = interest;
    map["created_at"] = createdAt.microsecondsSinceEpoch;
    return map;
  }

  factory Deposit.fromMap(Map<String, dynamic> data) {
    return Deposit(
      depositId: data['deposit_id'],
      bankId: data['bank_id'],
      amount: data['amount'],
      startDate: DateTime.fromMicrosecondsSinceEpoch(data['start_date']),
      month: data['month'],
      interest: data['interest'],
      createdAt: DateTime.fromMicrosecondsSinceEpoch(data['created_at']),
    );
  }

  @override
  String toString() {
    return "Deposit: $depositId, Amount: $amount";
  }
}
