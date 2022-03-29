import 'package:atrdetector/constants.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
    required this.status,
    required this.date,
    required this.ph,
  }) : super(key: key);

  final String status, date, ph;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: thisDefaultPadding * 0.12,
          left: thisDefaultPadding * 0.25,
          right: thisDefaultPadding * 0.25),
      decoration: BoxDecoration(
          color: thisPrimaryColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: thisPrimaryColor.withOpacity(0.40))
          ],
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.only(
          left: thisDefaultPadding * 0.5,
          right: thisDefaultPadding * 0.5,
          top: thisDefaultPadding * 0.2,
          bottom: thisDefaultPadding * 0.2),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          Text(
            ph,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
