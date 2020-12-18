import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Form(
          child: Column(
            children: <Widget>[
              Text(
                "Update your brew settings.",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: "hello",
                validator: (val) =>
                val.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => {},
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
