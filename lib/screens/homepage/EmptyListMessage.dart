import 'package:flutter/material.dart';

class EmptyListMessage extends StatelessWidget {
  const EmptyListMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Text(
        "Currently no flight trackers",
        style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic
        ),
      ),
    );
  }
}
