import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas4_kelompok/login.dart';
import 'package:tugas4_kelompok/model/login_model.dart';

String loginBox = 'loginBox';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<LoginModel>(LoginModelAdapter());
  await Hive.openBox<LoginModel>(loginBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //buang wm debug
      title: 'Tugas TPM 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
