import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../campingData.dart';

class ReviewService extends ChangeNotifier {
  final reviewCollection = FirebaseFirestore.instance.collection('review');

//ReviewService의 Read, Create
  Future<QuerySnapshot> read(int? contentId) async {
    // 모든 reviewList 가져오기
    return reviewCollection.where('contentId', isEqualTo: contentId).get();
  }

  void create(String review, String uid, double star) async {
    // review 만들기
    await reviewCollection.add({
      'contentId': SelectedData.selectedItem?.contentId,
      'uid': uid, // 유저 식별자
      'review': review, // 남긴 후기
      'star': star, // 별점 갯수
      //'contentid': contentId, // 캠핑장주소
    });
    notifyListeners(); // 화면 갱신
  }

  void update(String docId, String review, double star) async {
    // review 업데이트
    await reviewCollection.doc(docId).update({
      'review': review,
      'star': star,
    });
    notifyListeners(); // 화면 갱신
  }

  void delete(String docId) async {
    // review 삭제
    await reviewCollection.doc(docId).delete();
    notifyListeners(); // 화면 갱신
  }
}


//스냅샷은 빈 깡똥 찌고 함수를 실행하고 당겨오면 스냅샷이 생김, 스냅샷이 빈 깡통이 아니니까 데이터를 찍음
//다뮤먼트에 데이터가 있으니 까
