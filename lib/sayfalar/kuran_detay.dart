// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:kuran_app/model/kuran_model.dart';
import 'package:kuran_app/sabitler/padding.dart';
import 'package:kuran_app/servis/kuran_servis.dart';

import '../widget/geri_butonu.dart';

class KuranDetay extends StatefulWidget {
  final int index;
  const KuranDetay({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<KuranDetay> createState() => _KuranDetayState();
}

class _KuranDetayState extends State<KuranDetay> {
  List<KuranModel> kuranList1 = [];
  @override
  void initState() {
    KuranServis.kuranJsonOku(context).then((value) {
      kuranList1 = value;
    });
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double deviceHeight = mediaQueryData.size.height;
    double deviceWidth = mediaQueryData.size.width;
    TextStyle textStyle =
        Theme.of(context).textTheme.headline6!.copyWith(fontFamily: "Libre");
    TextStyle aciklama =
        Theme.of(context).textTheme.titleMedium!.copyWith(fontFamily: "Libre");

    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
              future: KuranServis.kuranJsonOku(context),
              builder: ((context, snapshot) {
                return Padding(
                  padding: PaddingAll.all(),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          KuranDetayAppBar(deviceHeight, deviceWidth, context),
                          kuranDatayBilgi(deviceHeight, deviceWidth, textStyle),
                          acikalamaMetot(
                              deviceHeight, deviceWidth, textStyle, aciklama)
                        ],
                      ),
                    ),
                  ),
                );
              }))),
    );
  }

  Container acikalamaMetot(double deviceHeight, double deviceWidth,
      TextStyle textStyle, TextStyle aciklama) {
    return Container(
      height: deviceHeight / 1.8,
      width: deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Açıklama",
            style: textStyle,
          ),
          SizedBox(
            height: deviceHeight / 45,
          ),
          Text(
            kuranList1[widget.index].sureaciklama,
            style: aciklama,
          )
        ],
      ),
    );
  }

  Container kuranDatayBilgi( double deviceHeight, double deviceWidth, TextStyle textStyle) {
    return Container(
        height: deviceHeight / 2,
        width: deviceWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Arapça Adı :",
                  style: textStyle,
                ),
                Text(
                  "Okunuşu :",
                  style: textStyle,
                ),
                Text(
                  "Sayfa :",
                  style: textStyle,
                ),
                Text(
                  "Ayet Sayısı :",
                  style: textStyle,
                ),
                Text(
                  "Cüz :",
                  style: textStyle,
                ),
                Text(
                  "İniş Sırası :",
                  style: textStyle,
                ),
                Text(
                  "İniş Yeri :",
                  style: textStyle,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  kuranList1[widget.index].sureadiar,
                  style: textStyle,
                ),
                Text(
                  kuranList1[widget.index].sureadiaroku,
                  style: textStyle,
                ),
                Text(
                  kuranList1[widget.index].sayfa,
                  style: textStyle,
                ),
                Text(
                  kuranList1[widget.index].ayetsayisi,
                  style: textStyle,
                ),
                Text(
                  kuranList1[widget.index].cuz,
                  style: textStyle,
                ),
                Text(
                  kuranList1[widget.index].inissira,
                  style: textStyle,
                ),
                Text(
                  kuranList1[widget.index].yer,
                  style: textStyle,
                )
              ],
            ),
          ],
        ));
  }

  SizedBox KuranDetayAppBar(
      double deviceHeight, double deviceWidth, BuildContext context) {
    return SizedBox(
      height: deviceHeight / 15,
      width: deviceWidth,
      child: Row(
        children: [
          geriButonu(deviceHeight: deviceHeight, deviceWidth: deviceWidth),
          SizedBox(
            width: deviceWidth / 6,
          ),
          Text(
            kuranList1[widget.index].sureaditr,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontFamily: "Libre"),
          )
        ],
      ),
    );
  }
}
