import 'package:account_book/models/models.dart';
import 'package:account_book/pages/bank/bank_page.dart';
import 'package:account_book/services/services.dart';
import 'package:account_book/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepositCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deposit"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
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
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _periodController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  DateTime _fromDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Provider.of<DepositService>(context).loadBankOptions();

    return SizedBox(
      child:
          Consumer<DepositService>(builder: (context, depositService, child) {
        return DropdownButtonHideUnderline(
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  ),
                  style: Theme.of(context).textTheme.display1,
                ),
                DateTimePicker(
                  labelText: 'From',
                  selectedDate: _fromDate,
                  selectDate: (DateTime date) {
                    setState(() {
                      _fromDate = date;
                    });
                  },
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _periodController,
                  decoration: InputDecoration(
                    labelText: 'Peroid (Month)',
                    //border: OutlineInputBorder(),
                  ),
                  //style: Theme.of(context).textTheme.title,
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _interestController,
                  decoration: InputDecoration(
                    labelText: 'Interest',
                    //border: OutlineInputBorder(),
                  ),
                  //style: Theme.of(context).textTheme.title,
                ),
                /*InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Bank',
                    hintText: 'Choose the bank',
                  ),
                  child: DropdownButton<int>(
                    value: depositService.currentBankId,
                    onChanged: (int bankId) {
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
                ),*/
                const SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Text(
                      "Bank",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),
                ListTile(
                  trailing: RaisedButton(
                    child: Text("Add Bank"),
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
          ),
        );
      }),
    );
  }
}
