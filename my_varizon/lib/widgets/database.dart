import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  String userID;
  dynamic password;
  String securityQuestion;
  String securityAnswer;
  Database({
    required this.userID,
    required this.password,
    required this.securityQuestion,
    required this.securityAnswer,
  });
  final firesBase = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getData() async {
    final data = {
      "userID": userID,
      "password": password,
      "securityQuestion": securityQuestion,
      "securityAnswer": securityAnswer,
    };
    try {
      await firesBase.collection('loginInfo').add(data);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {};
    }
    return data;
  }
}
