import 'package:account_book/models/models.dart';
import 'package:account_book/pages/bank/bank_page.dart';
import 'package:account_book/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepositCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deposit"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: DepositEditForm()),
    );
  }
}

class DepositEditForm extends StatefulWidget {
  @override
  _DepositEditFormState createState() => _DepositEditFormState();
}

class _DepositEditFormState extends State<DepositEditForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<DepositService>(context).loadBankOptions();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:
          Consumer<DepositService>(builder: (context, depositService, child) {
        return Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: const Text('Bank:'),
                subtitle: DropdownButton<int>(
                  value: depositService.currentBankId,
                  onChanged: (int bankId) {
                    print(bankId);
                    depositService.currentBankId = bankId;
                  },
                  items: depositService.bankOptions
                      .map<DropdownMenuItem<int>>((Bank bank) {
                    return DropdownMenuItem<int>(
                      value: bank.bankId,
                      child: Text(bank.name),
                    );
                  }).toList(),
                ),
                trailing: RaisedButton(
                  child: Text("Add"),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute<BankFormAction>(
                      builder: (BuildContext context) => BankFormPage(),
                      fullscreenDialog: true,
                    ));
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
