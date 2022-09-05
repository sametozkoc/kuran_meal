import 'package:flutter/material.dart';

import '../sabitler/margin.dart';

class AnaSayfaCard extends StatelessWidget {
  const AnaSayfaCard({
    Key? key,
    required this.siraNo,
    required this.arapca,
    required this.turkce,
    required this.onTap,
  }) : super(key: key);
  final String siraNo;
  final String arapca;
  final String turkce;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double deviceHeight = mediaQueryData.size.height;
    double deviceWidth = mediaQueryData.size.width;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 10,
        margin: const MarginAll.all(),
        child: ListTile(
          onTap: onTap,
          leading: Container(
            child: Center(
                child: Text(siraNo,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontFamily: "Libre"))),
            height: deviceHeight/16,
            width: deviceWidth/9,
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          ),
          subtitle: Text(arapca,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontFamily: "Libre")),
          title: Text(turkce,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontFamily: "Libre")),
        ));
  }
}
