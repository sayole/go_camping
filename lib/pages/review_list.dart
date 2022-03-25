import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_camping/campingData.dart';
import 'package:go_camping/main.dart';
import 'package:go_camping/service/auth_service.dart';
import 'package:go_camping/service/review_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'loginPage.dart';
import 'package:expandable_text/expandable_text.dart';

/// 리뷰 보는 페이지
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

var ratingSum = 0;
var ratingList = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;
    return Consumer<ReviewService>(builder: (context, reviewService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "고캠핑 리뷰",
            style: TextStyle(color: Palette.green),
          ),
          actions: [
            TextButton(
              onPressed: () {
                //로그아웃
                context.read<AuthService>().signOut();

                //로그인 페이지로 이동
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                '로그아웃',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Palette.green,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Image.network("${SelectedData.selectedItem?.firstImageUrl}"), // 이미지
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${SelectedData.selectedItem?.facltNm}", // 캠핑장 이름
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${SelectedData.selectedItem?.lineIntro}", // 캠핑장 한줄 소개
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Text("⭐️ 4.24"),
                      Text(" · "),
                      Text("리뷰 갯수 12개"),
                    ],
                  ),
                  Text(
                    "${SelectedData.selectedItem?.addr1} ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Divider(),
                  // 캠핑장 설명
                  Text("소개말", style: TextStyle(fontSize: 20)),
                  // 캠핑장 소개 글
                  ExpandableText(
                    "${SelectedData.selectedItem?.intro}",
                    expandText: 'show more',
                    collapseText: 'show less',
                    maxLines: 3,
                    linkColor: Palette.green,
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Palette.green,
                    ),
                    onPressed: () {
                      launch("${SelectedData.selectedItem?.resveUrl}"); // 예약
                    },
                    child: Text("예약하러 가기"),
                  ),
                ],
              ),
            ),
            Container(
              child: FutureBuilder<QuerySnapshot>(
                future:
                    reviewService.read(SelectedData.selectedItem?.contentId),
                builder: (context, snapshot) {
                  final documents = snapshot.data?.docs ?? []; // 문서들 가져오기
                  final docmany = documents.length;
                  if (documents.isEmpty) {
                    return Center(child: Text("리뷰가 없어요! 남겨주세용"));
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final doc = documents[index];
                      String review = doc.get('review');
                      double rating = doc.get('star');
                      int ratingInt = rating.toInt();
                      //리뷰 ListTile
                      return ListTile(
                        title: Text(review),
                        subtitle: StarDisplay(value: ratingInt),
                        trailing: doc.get('uid') != user.uid
                            ? Text('')
                            : Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // + 버튼 클릭시 리뷰 생성 페이지로 이동
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => CreatePage()),
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    icon: Icon(CupertinoIcons.delete),
                                    onPressed: () {
                                      reviewService.delete(doc.id);
                                    },
                                  ),
                                ],
                              ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // + 버튼 클릭시 리뷰 생성 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CreatePage()),
            );
          },
        ),
      );
    });
  }
}

/// 리뷰 생성 페이지
class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

double star = 0;

class _CreatePageState extends State<CreatePage> {
  TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;
    return Consumer<ReviewService>(builder: (context, reviewService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("리뷰 작성"),
          // 뒤로가기 버튼
          leading: IconButton(
            icon: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 텍스트 입력창
              Text(
                '리뷰 남기기',
              ),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      controller: jobController,
                      decoration: InputDecoration(
                        hintText: "후기를 남겨주세요",
                      ),
                    ),
                    SizedBox(height: 30),
                    Text('별점 남기기'),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                        star = rating;
                      },
                    ),
                  ],
                ),
              ),
              // 추가하기 버튼
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  child: Text(
                    "리뷰 남기기",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    // 추가하기 버튼 클릭시
                    if (jobController.text.isNotEmpty) {
                      reviewService.create(jobController.text, user.uid, star);
                      print('생성하기');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class StarDisplay extends StatelessWidget {
  final int value;

  const StarDisplay({Key? key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 16.5,
        );
      }),
    );
  }
}
