import 'package:flutter/foundation.dart';
import 'database.dart';
import 'package:account_book/models/models.dart';

class BankService extends ChangeNotifier {
  final DatabaseInstance dbInstance;

  BankService({@required this.dbInstance});

  Future<int> createBank({@required String name}) async {
    final bank = Bank(
      name: name,
      createdAt: DateTime.now(),
    );

    int id = await dbInstance.db.insert("bank", bank.toMapWithoutId());
    print("New bank $id is created");
    return id;
  }
}
