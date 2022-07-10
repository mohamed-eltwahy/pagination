import 'dart:math';

import 'package:pagination_flutter/dioapi.dart';

class PaginateRepo {
  static Future<Map<String, dynamic>> getAllData(
      {Map<String, String>? query}) async {
    // String jwt = await CashHelper.getSavedString("jwt", "");
    Map<String, String> headers = {
      "Accept": "application/json",
      // "Authorization": "Bearer $jwt"
    };
    List<String> q = [];
    if (query != null) {
      for (var item in query.entries) {
        q.add('${item.key}=${item.value}');
        // log(int.parse(item.));
      }
      log(int.parse(q.toString()));
      log(int.parse(q.map((e) => e).toList().join('&')));
    }
    dynamic response = await DioApi.sendDioApiRequest(
      url:
          "https://api.instantwebtools.net/v1/passenger?${q.map((e) => e).toList().join('&')}",
      methodType: 'get',
      dioHeaders: headers,
    );
    return response;
  }
}
