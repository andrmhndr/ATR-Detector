// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'header.dart';
import 'main_background.dart';
import 'main_data.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Stack(
        children: [
          Header(),
          MainBackground(),
          MainData(),
        ],
      ),
    );
  }
}
