import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

/// 로그인 페이지
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  /// 배경 이미지 URL
  final String backImg =
      "https://i.ibb.co/2Pz33q7/2021-12-16-12-21-42-cleanup.png";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100,
            ),

            /// 현재 유저 로그인 상태
            Center(
              child: Text(
                "고캠핑 GoCamping🙂",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 32),

            /// 아이디
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "ID"),
            ),

            /// 비밀번호
            TextField(
              controller: passwordController,
              obscureText: false, // 비밀번호 안보이게
              decoration: InputDecoration(hintText: "PassWord"),
            ),
            SizedBox(height: 32),

            /// 로그인 버튼
            ElevatedButton(
              child: Text("로그인", style: TextStyle(fontSize: 21)),
              onPressed: () {
                // 로그인 성공시 HomePage로 이동
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
            ),

            /// 회원가입 버튼
            ElevatedButton(
              child: Text("회원가입", style: TextStyle(fontSize: 21)),
              onPressed: () {
                // 회원가입
                print("sign up");
              },
            ),
          ],
        ),
      ),
    );
  }
}
