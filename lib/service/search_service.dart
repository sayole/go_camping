import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_camping/campingData.dart';

class SearchService extends ChangeNotifier {
  List<CampingData> campingList = [];

  Future<void> getData(String searchedKeyword) async {
    var keyword = Uri.encodeComponent(searchedKeyword);
    var serviceKey =
        "upmkIzC7mRUHtS6qc1ZTeHW9TjcSrBgvE60ZPQU%2BnJnoG2dtEhLVCU21gL%2BQ2ML48M3SFd3oJzO%2B%2BOlGL7STHA%3D%3D";
    var result = await Dio().get(
      "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList?ServiceKey=${serviceKey}&numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=GoCamping&_type=json&keyword=${keyword}",
    );
    // print(result.data['response']['body']['items']['item'][0]);

    // print(CampingData.fromJson(result.data['response']['body']['items'][0]));

    for (var item in result.data['response']['body']['items']['item']) {
      campingList.add(CampingData.fromJson(item));
    }
    // print(result.data['response']['body']['items']);
    notifyListeners();
  }
}
