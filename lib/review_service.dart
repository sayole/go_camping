import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReviewService extends ChangeNotifier {
  final reviewCollection = FirebaseFirestore.instance.collection('review');

  Future<QuerySnapshot> read(String uid) async {
    // 모든 reviewList 가져오기
    return reviewCollection.where('uid', isEqualTo: uid).get();
  }

  void create(String job, String uid) async {
    // review 만들기
    await reviewCollection.add({
      'uid': uid, // 유저 식별자
      'review': job, // 하고싶은 일
      'isDone': false, // 완료 여부
    });
    notifyListeners(); // 화면 갱신
  }

  void update(String docId, bool isDone) async {
    // bucket isDone 업데이트
    await reviewCollection.doc(docId).update({'isDone': isDone});
    notifyListeners(); // 화면 갱신
  }

  void delete(String docId) async {
    // bucket 삭제
    await reviewCollection.doc(docId).delete();
    notifyListeners(); // 화면 갱신
  }
}
