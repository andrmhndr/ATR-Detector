import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:flutterfire_ui/firestore.dart';
import '../../constants.dart';
import '../../model/history_item_model.dart';
import 'item.dart';

class MainData extends StatelessWidget {
  const MainData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final realtime = FirebaseDatabase.instance.ref();

    final historyItemCollection =
        firestore.collection('history').withConverter<HistoryItemModel>(
              fromFirestore: (snapshot, _) =>
                  HistoryItemModel.fromJson(snapshot.data()!),
              toFirestore: (historyItem, _) => historyItem.toJson(),
            );

    Size size = MediaQuery.of(context).size;

    widthCheck(double widthSize) {
      double width;
      if (widthSize > 550) {
        width = 550;
      } else {
        width = widthSize;
      }
      return width;
    }

    potentialCheck(double ph) {
      String status;
      if (ph <= 5.3) {
        status = 'POTENTIAL';
      } else {
        status = 'NO POTENTIAL';
      }
      return status;
    }

    saveData(bool getData, double ph, String status) {
      if (getData) {
        firestore
            .collection('history')
            .add({
              'ph': ph,
              'status': status,
              'timestamp': DateTime.now(),
            })
            .then((value) => print('data added'))
            .catchError((onError) => print('error $onError'));
        realtime.child('data').child('get data').set(false);
      }
    }

    scanButton() {
      realtime.child('data').child('get data').set(true);
    }

    return Column(
      children: [
        Container(
          height: size.height * 0.25,
        ),
        Expanded(
          child: Container(
            width: widthCheck(size.width),
            padding: EdgeInsets.symmetric(horizontal: thisDefaultPadding),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                        width: size.width,
                        margin: EdgeInsets.only(
                          bottom: thisDefaultPadding * 0.25,
                        ),
                        child: FirebaseDatabaseQueryBuilder(
                            query: realtime,
                            builder: (context, snapshot, _) {
                              if (snapshot.hasData) {
                                final data = snapshot.docs[0].value as Map;
                                final ph = double.parse(
                                    data['result'].toStringAsFixed(2));
                                String status = potentialCheck(ph);
                                saveData(data['get data'], ph, status);
                                realtime
                                    .child('data')
                                    .child('get data')
                                    .set(false);
                                return SizedBox(
                                  width: size.width * 0.4,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: size.width * 0.15,
                                              child: Text("Status")),
                                          Text(": "),
                                          Spacer(),
                                          Text(status),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.15,
                                            child: Text("PH"),
                                          ),
                                          Text(": "),
                                          Spacer(),
                                          Text(ph.toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Text('Data tidak terbaca');
                              }
                            })),
                    TextButton(
                      onPressed: () {
                        scanButton();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: thisDefaultPadding * 0.5,
                              vertical: thisDefaultPadding * 0.15),
                          decoration: BoxDecoration(
                              color: thisPrimaryColor,
                              borderRadius: BorderRadius.circular(36)),
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: thisDefaultPadding * 0.15),
                  margin:
                      EdgeInsets.symmetric(vertical: thisDefaultPadding * 0.25),
                  decoration: BoxDecoration(
                      color: thisPrimaryColor,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: thisPrimaryColor.withOpacity(0.23))
                      ],
                      borderRadius: BorderRadius.circular(36)),
                  child: Center(
                    child: Text(
                      "Recent :",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Expanded(
                  child: FirestoreListView<HistoryItemModel>(
                    query: historyItemCollection.orderBy('timestamp',
                        descending: true),
                    itemBuilder: (context, snapshot) {
                      HistoryItemModel historyItem = snapshot.data();
                      return HistoryItem(
                          status: historyItem.status,
                          date: DateTime.parse(
                                  historyItem.date.toDate().toString())
                              .toString(),
                          ph: historyItem.ph.toString());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
