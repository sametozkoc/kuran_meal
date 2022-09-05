import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuran_app/sayfalar/ana_sayfa.dart';

void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuran Uygulaması',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
        
          backgroundColor: Colors.transparent,
          toolbarHeight: 45,
          titleTextStyle: Theme.of(context).textTheme.headline5!.copyWith(fontFamily: "Libre"),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(size: 30,color: Colors.black)
        )
      ),

      home: AnaSayfa()
    );
  }
}
