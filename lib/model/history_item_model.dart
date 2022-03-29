import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryItemModel {
  HistoryItemModel(
      {required this.status, required this.date, required this.ph});

  HistoryItemModel.fromJson(Map<String, Object?> json)
      : this(
            status: json['status']! as String,
            date: json['timestamp']! as Timestamp,
            ph: json['ph']! as double);

  final String status;
  final Timestamp date;
  final double ph;

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'date': date,
      'ph': ph,
    };
  }
}
