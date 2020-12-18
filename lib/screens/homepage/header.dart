import 'package:flutter/material.dart';
import 'package:frugal_flights/common/constants.dart';


class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Text(
          "Frugal Flights",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 42,
            color: Colors.white,
            shadows: [
              BoxShadow(
                offset: Offset(0, 8),
                color: kPrimaryColor.withOpacity(0.23),
              ),
            ]
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
