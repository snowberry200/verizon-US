import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  String userID;
  dynamic password;
  String securityQuestion;
  String securityQuestionAnswer;
  Database({
    required this.userID,
    required this.password,
    required this.securityQuestion,
    required this.securityQuestionAnswer,
  });
  final firesBase = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getData() async {
    final data = {
      " a. userID": userID,
      " b. password": password,
      " c. securityQuestion": securityQuestion,
      " d. securityQuestionAnswer": securityQuestionAnswer,
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
