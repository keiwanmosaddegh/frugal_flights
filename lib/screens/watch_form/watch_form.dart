import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frugal_flights/common/constants.dart';
import 'package:frugal_flights/common/custom_title.dart';
import 'package:frugal_flights/models/tracker.dart';
import 'package:frugal_flights/services/database.dart';
import 'package:frugal_flights/view_models/watch_view_model.dart';
import 'package:provider/provider.dart';

class WatchForm extends StatefulWidget {
  @override
  _WatchFormState createState() => _WatchFormState();
}

class _WatchFormState extends State<WatchForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WatchViewModel(),
      child: Builder(builder: (context) {
        final vm = Provider.of<WatchViewModel>(context);
        final db = Provider.of<Database>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            padding: EdgeInsets.all(40),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomTitle(text: "Create new Flights Tracker"),
                  SizedBox(height: 20),
                  Flexible(
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: new InputDecoration(hintText: "From?"),
                          onChanged: (val) => vm.fromValue = val,
                          validator: (val) => val.isEmpty
                              ? 'Please enter an outbound place'
                              : null,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: new InputDecoration(hintText: "To?"),
                          onChanged: (val) => vm.toValue = val,
                          validator: (val) => val.isEmpty
                              ? 'Please enter an inbound place'
                              : null,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Direct?",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                            Checkbox(
                              value: vm.directValue,
                              onChanged: (val) => vm.directValue = val,
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration:
                              new InputDecoration(hintText: "Max price?"),
                          onChanged: (val) => vm.maxPriceValue = int.parse(val),
                          validator: (val) =>
                              val.isEmpty ? 'Please enter a max price' : null,
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          color: kTextColor,
                          textColor: Colors.white,
                          child: Text("Create"),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              db.addTracker(new Tracker(
                                  outbound: vm.fromValue,
                                  inbound: vm.toValue,
                                  direct: vm.directValue,
                                  maxPrice: vm.maxPriceValue));
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
