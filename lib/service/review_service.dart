import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ReviewService extends ChangeNotifier {
  final reviewCollection = FirebaseFirestore.instance.collection('review');

  Future<QuerySnapshot> read(String uid) async {
    // 모든 reviewList 가져오기
    return reviewCollection.where('uid', isEqualTo: uid).get();
  }

  void create(String review, String uid, double star) async {
    // review 만들기
    await reviewCollection.add({
      'uid': uid, // 유저 식별자
      'review': review, // 남긴 후기
      'star': star, // 별점 갯수
    });
    notifyListeners(); // 화면 갱신
  }

  void update(String docId, String review) async {
    // review 업데이트
    await reviewCollection.doc(docId).update({'review': review});
    notifyListeners(); // 화면 갱신
  }

  void delete(String docId) async {
    // review 삭제
    await reviewCollection.doc(docId).delete();
    notifyListeners(); // 화면 갱신
  }
}
