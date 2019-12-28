import 'package:account_book/pages/bank/bank_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Account Book'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.av_timer),
              text: "Appointment",
            ),
            Tab(
              icon: Icon(Icons.contacts),
              text: "Contacts",
            ),
            Tab(
              icon: Icon(Icons.note),
              text: "Notes",
            ),
            Tab(
              icon: Icon(Icons.assignment_turned_in),
              text: "Tasks",
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            BankPage(),
            BankPage(),
            BankPage(),
            BankPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.of(context).pushNamed('/Deposit/Create');
          },
        ),
      ),
    );
  }
}