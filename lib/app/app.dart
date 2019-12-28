import 'package:account_book/pages/deposit/deposit_page.dart';
import 'package:account_book/pages/home/home_page.dart';

import 'package:flutter/material.dart';

class AccountBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/Deposit/Create': (BuildContext buildContext) => DepositCreatePage(),
        '/Home': (BuildContext buildContext) => HomePage(),
      },
    );
  }
}


