import 'dart:io';

import 'package:account_book/app/app.dart';
import 'package:account_book/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  void startUp() async {
    WidgetsFlutterBinding.ensureInitialized();

    DatabaseInstance instance = DatabaseInstance();
    //Directory documentsDirectory = await getApplicationDocumentsDirectory();
    await instance.initDb();

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => BankService(dbInstance: instance),
          ),
          ChangeNotifierProvider(
            create: (_) => DepositService(dbInstance: instance),
          )
        ],
        child: AccountBookApp(),
      ),
    );
  }

  startUp();
}
