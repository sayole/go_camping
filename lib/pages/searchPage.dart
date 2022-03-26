import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_camping/campingData.dart';
import 'package:go_camping/main.dart';
import 'package:go_camping/pages/review_list.dart';
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
                  textAlign: TextAlign.justify,
                  controller: textEditingController,
                  onSubmitted: (String str) async {
                    // print(textEditingController.text);
                    await searchService.getData(textEditingController.text);
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Palette.green)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: '🔎 어디로 캠핑 가시나요?',
                    suffixIcon: TextButton(
                      onPressed: () async {
                        print(textEditingController.text);
                        await searchService.getData(textEditingController.text);
                      },
                      child: Text(
                        "GO",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Palette.green,
                        ),
                      ),
                    ),
                  ),
                ),
                searchService.campingList.isEmpty
                    ? Center(child: Text("캠핑지를 찾아보자"))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: searchService.campingList.length,
                          itemBuilder: (context, index) {
                            CampingData item = searchService.campingList[index];
                            return GestureDetector(
                              onTap: () {
                                SelectedData.selectedItem = item;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => HomePage(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Card(
                                  color: Color(0xFFE7E4D3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: SizedBox(
                                            height: 115,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: item.firstImageUrl.isEmpty
                                                  ? Image.asset(
                                                      'assets/photo_not_ready2.png',
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.network(
                                                      item.firstImageUrl,
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            height: 115,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 21,
                                                  child: Wrap(
                                                    alignment:
                                                        WrapAlignment.start,
                                                    spacing: 8,
                                                    children: [
                                                      ...item.featureList
                                                          .where((e) =>
                                                              e['value'] ==
                                                                  'Y' ||
                                                              e['value'] ==
                                                                  '가능')
                                                          .take(2)
                                                          .map((e) => Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .green,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          8,
                                                                          2,
                                                                          8,
                                                                          4),
                                                                  child: Text(
                                                                    e['name'],
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ))
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  item.facltNm,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 4),
                                                        child: Text(
                                                          item.lineIntro,
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        item.lctCl.trim(),
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  item.doNm +
                                                      ' ' +
                                                      item.sigunguNm,
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}
