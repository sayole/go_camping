import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_camping/main.dart';
import 'package:go_camping/pages/searchPage.dart';
import 'package:go_camping/service/auth_service.dart';
import 'package:provider/provider.dart';

/// 로그인 페이지
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset(
                    'assets/chang.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                /// 아이디
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(hintText: "이메일"),
                      ),

                      /// 비밀번호
                      TextField(
                        controller: passwordController,
                        obscureText: false, // 비밀번호 안보이게
                        decoration: InputDecoration(hintText: "PassWord"),
                      ),
                      SizedBox(height: 30),

                      /// 현재 유저 로그인 상태
                      Center(
                        child: Text(
                          "로그인해 주세요",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ),

                      SizedBox(height: 20),

                      /// 로그인 버튼
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(400, 20),
                                  primary: Palette.green),
                              child:
                                  Text("로그인", style: TextStyle(fontSize: 20)),
                              onPressed: () {
                                // 로그인
                                authService.signIn(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  onSuccess: () {
                                    // 로그인 성공
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("로그인 성공"),
                                    ));

                                    //HomePage로 이동
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchPage()),
                                    );
                                  },
                                  onError: (err) {
                                    // 에러 발생
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(err),
                                    ));
                                  },
                                );
                              },
                            ),

                            /// 회원가입 버튼
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(400, 20),
                                  primary: Palette.green),
                              child:
                                  Text("회원가입", style: TextStyle(fontSize: 20)),
                              onPressed: () {
                                // 회원가입
                                authService.signUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  onSuccess: () {
                                    // 회원가입 성공
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("회원가입 성공"),
                                    ));
                                  },
                                  onError: (err) {
                                    // 에러 발생
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(err),
                                    ));
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
