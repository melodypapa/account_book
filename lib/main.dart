import 'package:account_book/app/app.dart';
import 'package:account_book/services/services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BankService(),
        ),
        ChangeNotifierProvider(
          create: (_) => DepositService(),
        )
      ],
      child: AccountBookApp(),
    ),
  );
}
