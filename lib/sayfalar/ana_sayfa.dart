import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kuran_app/model/kuran_model.dart';
import 'package:kuran_app/sabitler/margin.dart';
import 'package:kuran_app/sayfalar/kuran_detay.dart';
import 'package:kuran_app/servis/kuran_servis.dart';
import 'package:kuran_app/widget/ana_sayfa_card.dart';

import '../widget/searchBar.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<KuranModel> kuranList = [];
  @override
  void initState() {
    KuranServis.kuranJsonOku(context).then((value) {
      kuranList = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double deviceHeight = mediaQueryData.size.height;
    double deviceWidth = mediaQueryData.size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Kuran Sureleri"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              
              width: deviceWidth/6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
                
                ),
              child: IconButton(onPressed: (){
        showSearch(context: context, delegate: SearchBar());
       }, icon: Icon(Icons.search,size: 25,)),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<KuranModel>>(
          future: KuranServis.kuranJsonOku(context),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: kuranList.length,
                  itemBuilder: ((context, index) {
                    var oankiData = kuranList[index];
                    return AnaSayfaCard(
                        siraNo: oankiData.kuransira,
                        arapca: oankiData.sureadiar,
                        turkce: oankiData.sureaditr,
                        onTap: () {
                          setState(() {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      KuranDetay(index: index))));
                          });
                        
                        });
                  }));
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    ));
  }
}
