import 'package:flutter/material.dart';
import 'package:yeap/constants/constants.dart';
import 'package:yeap/widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yeap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(centerTitle: true),
        hintColor: Sabitler.anaRenk,
        
      ),
      home: const OrtalamaHesaplaPage(),
    );
  }
}
