// To parse this JSON data, do
//
//     final kuranModel = kuranModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

KuranModel kuranModelFromMap(String str) => KuranModel.fromMap(json.decode(str));

String kuranModelToMap(KuranModel data) => json.encode(data.toMap());

class KuranModel {
    KuranModel({
        required this.sureaditr,
        required this.sureadiar,
        required this.sureadiaroku,
        required this.sureadien,
        required this.ayetsayisi,
        required this.cuz,
        required this.sayfa,
        required this.kuransira,
        required this.inissira,
        required this.alfabesira,
        required this.yer,
        required this.sureaciklama,
    });

    final String sureaditr;
    final String sureadiar;
    final String sureadiaroku;
    final String sureadien;
    final String ayetsayisi;
    final String cuz;
    final String sayfa;
    final String kuransira;
    final String inissira;
    final String alfabesira;
    final String yer;
    final String sureaciklama;

    factory KuranModel.fromMap(Map<String, dynamic> json) => KuranModel(
        sureaditr: json["sureaditr"],
        sureadiar: json["sureadiar"],
        sureadiaroku: json["sureadiaroku"],
        sureadien: json["sureadien"],
        ayetsayisi: json["ayetsayisi"],
        cuz: json["cuz"],
        sayfa: json["sayfa"],
        kuransira: json["kuransira"],
        inissira: json["inissira"],
        alfabesira: json["alfabesira"],
        yer: json["yer"],
        sureaciklama: json["sureaciklama"],
    );

    Map<String, dynamic> toMap() => {
        "sureaditr": sureaditr,
        "sureadiar": sureadiar,
        "sureadiaroku": sureadiaroku,
        "sureadien": sureadien,
        "ayetsayisi": ayetsayisi,
        "cuz": cuz,
        "sayfa": sayfa,
        "kuransira": kuransira,
        "inissira": inissira,
        "alfabesira": alfabesira,
        "yer": yer,
        "sureaciklama": sureaciklama,
    };
}
