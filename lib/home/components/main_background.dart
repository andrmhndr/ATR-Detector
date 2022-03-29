import 'package:flutter/material.dart';
import 'package:atrdetector/constants.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double widthCheck(double widthSize) {
      double width;
      if (widthSize > 550) {
        width = 550;
      } else {
        width = widthSize;
      }
      return width;
    }

    return Column(
      children: [
        Container(
          height: size.height * 0.2,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: thisDefaultPadding * 0.5),
            width: widthCheck(size.width),
            height: size.height * 0.8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: thisPrimaryColor.withOpacity(0.23))
                ]),
          ),
        ),
      ],
    );
  }
}
