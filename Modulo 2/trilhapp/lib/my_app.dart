import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'pages/home_page.dart';
import 'pages/login_page.dart';

//stl
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 204, 126, 10)),
            useMaterial3: true,
            textTheme: GoogleFonts.robotoMonoTextTheme()),
        home: const LoginPage());
  }
}
