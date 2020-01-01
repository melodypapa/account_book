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
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
  final FocusNode _amountFocusNode = FocusNode();
  final FocusNode _peroidFocusNode = FocusNode();
  final FocusNode _interestFocusNode = FocusNode();
  final FocusNode _bankFocusNode = FocusNode();
  DateTime _fromDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Provider.of<DepositService>(context).loadBankOptions();

    return SizedBox(
      child: Consumer<DepositService>(
        builder: (context, depositService, child) {
          return DropdownButtonHideUnderline(
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  DateTimePicker(
                    labelText: 'From',
                    selectedDate: _fromDate,
                    selectDate: (DateTime date) {
                      setState(() {
                        _fromDate = date;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  DepositTextField(
                    label: "Amount",
                    currentFocusField: _amountFocusNode,
                    controller: _amountController,
                    nextFocusField: _peroidFocusNode,
                    border: OutlineInputBorder(),
                    validation: (String value){
                      if (value.isEmpty){
                        return 'Please enter the amount.';
                      }
                      return null;
                    },
                  ),
                  DepositTextField(
                    label: "Period (Months)",
                    currentFocusField: _peroidFocusNode,
                    nextFocusField: _interestFocusNode,
                    controller: _periodController,
                    validation: (String value){
                      if (value.isEmpty){
                        return "Please enter the period.";
                      }
                      return null;
                    },
                  ),
                  DepositTextField(
                    label: 'Interest(%)',
                    currentFocusField: _interestFocusNode,
                    controller: _interestController,
                    nextFocusField: _bankFocusNode,
                    validation: (String value){
                      if (value.isEmpty){
                        return 'Please enter the interest of each month';
                      }
                      return null;
                    },
                  ),
                  InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Bank',
                      hintText: 'Choose the bank',
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: DropdownButton<int>(
                            focusNode: _bankFocusNode,
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
                        ),
                        RaisedButton(
                          child: Text("Add Bank"),
                          onPressed: () async {
                            depositService.currentBankId =
                                await Navigator.of(context)
                                    .push(MaterialPageRoute<int>(
                              builder: (BuildContext context) => BankFormPage(),
                              fullscreenDialog: true,
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ListTile(
                    trailing: RaisedButton(
                      child: Text("Save"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DepositTextField extends StatelessWidget {
  const DepositTextField({
    Key key,
    @required this.label,
    @required this.controller,
    @required this.currentFocusField,
    this.nextFocusField,
    this.border,
    @required this.validation,
  }) : super(key: key);

  final String label;
  final FocusNode currentFocusField;
  final FocusNode nextFocusField;
  final TextEditingController controller;
  final InputBorder border;
  final String Function(String) validation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          focusNode: currentFocusField,
          keyboardType: TextInputType.number,
          textInputAction: this.nextFocusField == null
              ? TextInputAction.go
              : TextInputAction.next,
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: border,
          ),
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(nextFocusField);
          },
          validator: validation,
          style: Theme.of(context).textTheme.title,
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
