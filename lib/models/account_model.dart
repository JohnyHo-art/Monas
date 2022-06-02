import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String userName;
  String dateFormat;
  DateTime notificationTime;
  bool soundNotificationOn;

  Account({
    required this.userName,
    required this.dateFormat,
    required this.notificationTime,
    required this.soundNotificationOn,
  });

// Extract JSON file to account object
  factory Account.fromJSON(json) {
    return Account(
        userName: json['userName'],
        dateFormat: json['dateFormat'],
        notificationTime: (json['notificationTime'] as Timestamp).toDate(),
        soundNotificationOn: json['soundNotificationOn']);
  }

  // Package user object to the JSON file
  Map<String, dynamic> toJSON() {
    return {
      'userName': userName,
      'dateFormat': dateFormat,
      'notificationTime': notificationTime,
      'soundNotificationOn': soundNotificationOn,
    };
  }
}
