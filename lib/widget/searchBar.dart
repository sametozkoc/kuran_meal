import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/kuran_model.dart';
import '../sayfalar/kuran_detay.dart';
import '../servis/kuran_servis.dart';
import 'ana_sayfa_card.dart';

class SearchBar extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final deviceHeight = mediaQueryData.size.height;
    final deviceWidth = mediaQueryData.size.width;
    return Container(
      height: deviceHeight,
      width: double.infinity,
      child: FutureBuilder<List<KuranModel>>(
          future: kuranJsonOku(context: context, query: query),
          builder: ((context, snapshot) {
            List<KuranModel>? kuranListesi = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: kuranListesi!.length,
                  itemBuilder: ((context, index) {
                    var oankiData = kuranListesi[index];
                    return AnaSayfaCard(
                        siraNo: oankiData.kuransira,
                        arapca: oankiData.sureadiar,
                        turkce: oankiData.sureaditr,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      KuranDetay(index: index))));
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    final deviceHeight = mediaQueryData.size.height;
    final deviceWidth = mediaQueryData.size.width;
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      child: Center(
        child: Text(
          "Aramak için yazınız...",
          style: Theme.of(context).textTheme.headline4!.copyWith(fontFamily:"Lidra"),
        ),
      ),
    );
  }

  static Future<List<KuranModel>> kuranJsonOku(
      {required BuildContext context, String? query}) async {
    String okunanString = await DefaultAssetBundle.of(context)
        .loadString("assets/json/kuran.json");

    var jsonObject = jsonDecode(okunanString);
    List<KuranModel> kuran = (jsonObject as List)
        .map((kelimeMap) => KuranModel.fromMap(kelimeMap))
        .toList();
    if (query != null) {
      kuran = kuran
          .where((element) =>
              element.sureaditr.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    return kuran;
  }
}
