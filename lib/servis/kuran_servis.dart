import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/kuran_model.dart';

class KuranServis{
   static  Future<List<KuranModel>> kuranJsonOku(BuildContext context) async {
    String okunanString = await DefaultAssetBundle.of(context)
        .loadString("assets/json/kuran.json");

    var jsonObject = jsonDecode(okunanString);
    List<KuranModel> kuran = (jsonObject as List)
        .map((kelimeMap) => KuranModel.fromMap(kelimeMap))
        .toList();
    
    return kuran;
  }
}