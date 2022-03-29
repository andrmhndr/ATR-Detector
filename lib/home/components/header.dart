import 'package:flutter/material.dart';
import 'package:atrdetector/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double widthCheck(double widthSize) {
      double width;
      if (widthSize > 700) {
        width = 700;
      } else {
        width = widthSize;
      }
      return width;
    }

    return Column(
      children: [
        Container(
          height: size.height * 0.3,
          width: widthCheck(size.width),
          decoration: BoxDecoration(
              color: thisPrimaryColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: thisPrimaryColor.withOpacity(0.23))
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36))),
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: size.height * 0.11),
            child: Text(
              "ATR DETECTOR",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        Expanded(child: Container())
      ],
    );
  }
}
