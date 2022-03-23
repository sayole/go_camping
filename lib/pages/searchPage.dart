import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_camping/campingData.dart';
import 'package:go_camping/service/search_service.dart';
import 'package:go_camping/service/search_service.dart';
import 'package:provider/provider.dart';

/// 로그인 페이지
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchService>(builder: (context, searchService, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Text(
                    "GoCamping은 한국에 있는\n캠핑장만 지원합니다",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    hintText: '원하시는 책을 검색해주세요.',
                    suffixIcon: IconButton(
                      onPressed: () async {
                        print(textEditingController.text);
                        await searchService.getData(textEditingController.text);
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                searchService.campingList.isEmpty
                    ? Center(
                        child: Text('검색해주세여'),
                      )
                    : ListView.builder(
                        itemCount: searchService.campingList.length,
                        itemBuilder: (context, index) {
                          CampingData item = searchService.campingList[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(children: [
                              Container(
                                child: Image.network(item.firstImageUrl),
                              ),
                            ]),
                          );
                        },
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}
