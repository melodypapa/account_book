import 'package:account_book/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Bank");
  }
}

enum BankFormAction {
  cancel,
  dismiss,
  save,
}

class BankFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Bank'),
      ),
      body: BankForm(),
    );
  }
}

class BankForm extends StatefulWidget {
  @override
  _BankFormState createState() => _BankFormState();
}

class _BankFormState extends State<BankForm> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formState = GlobalKey<FormState>();
    final TextEditingController _textNameController = TextEditingController();

    return Form(
      key: _formState,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: TextFormField(
              controller: _textNameController,
              /*inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter(RegExp("[a-fA-F0-9]")),
              ],*/
              decoration: InputDecoration(
                labelText: "Bank name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ListTile(
            title: RaisedButton(
              child: Text("Save"),
              onPressed: () async{
                int id = await Provider.of<BankService>(context).createBank(name: _textNameController.text);
                Navigator.of(context).pop(id);
              },
            ),
          )
        ],
      ),
    );
  }
}
