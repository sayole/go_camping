import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_camping/pages/loginPage.dart';
import 'package:go_camping/pages/review_list.dart';
import 'package:go_camping/pages/searchPage.dart';
import 'package:go_camping/service/review_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'service/auth_service.dart';
import 'service/search_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용하기 위함
  await Firebase.initializeApp(); // firebase 앱 시작
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => ReviewService()),
        ChangeNotifierProvider(create: (context) => SearchService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Palette.background),
        scaffoldBackgroundColor: Palette.background,
        primaryColor: Colors.white,
        accentColor: Palette.green,
        iconTheme: const IconThemeData(
          color: Palette.green,
          size: 30,
        ),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: LoginPage(),
    );
  }
}

class Palette {
  static const Color background = Color(0xFFF0F0E4);
  static const Color green = Color.fromARGB(255, 0, 73, 44);
  static const Color red = Color.fromARGB(255, 254, 110, 98);
}
