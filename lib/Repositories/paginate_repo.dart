import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:pagination_flutter/dioapi.dart';

import '../apputl.dart';

class PaginateRepo {
  static Future<Map<String, dynamic>> getAllData(
      {Map<String, String>? query}) async {
    // String jwt = await CashHelper.getSavedString("jwt", "");
    Map<String, String> headers = {
      "Accept": "application/json",
      "Accept-Language": "ar"
    };
    List<String> q = [];
    if (query != null) {
      for (var item in query.entries) {
        q.add('${item.key}=${item.value}');
        // log(int.parse(item.));
      }
    }

    var res = await http.get(
        AppUtill.setApi("passenger?${q.map((e) => e).toList().join('&')}"),
        headers: headers);

    Map<String, dynamic> mapResponse = jsonDecode(res.body);
    return mapResponse;
  }
}
