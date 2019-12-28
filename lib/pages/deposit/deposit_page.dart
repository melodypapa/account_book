import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final TextEditingController _textNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: TextFormField(
                controller: _textNameController,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter(RegExp("[a-fA-F0-9]")),
                ],
                decoration: InputDecoration(
                  labelText: "Bank name",
                  border: OutlineInputBorder(),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  print("Add Bank");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
