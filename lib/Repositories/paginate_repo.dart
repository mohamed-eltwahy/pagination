import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:pagination_flutter/dioapi.dart';

class PaginateRepo {
  static Future<Map<String, dynamic>> getAllData(
      {Map<String, String>? query}) async {
    // String jwt = await CashHelper.getSavedString("jwt", "");
    Map<String, String> headers = {
      "Accept": "application/json",
      "Accept-Language": "ar"

      // "Authorization": "Bearer $jwt"
    };
    List<String> q = [];
    if (query != null) {
      for (var item in query.entries) {
        q.add('${item.key}=${item.value}');
        // log(int.parse(item.));
      }
      // log(int.parse(q.toString()));
      // log(int.parse(q.map((e) => e).toList().join('&')));
    }
    //  var res =   await http.get(
    //     Uri.parse("https://api.instantwebtools.net/v1/passenger?${q.map((e) => e).toList().join('&')}"),
    //           headers: headers);
    //           Map<String, dynamic> mapResponse = jsonDecode(res.body);
    //           // log(mapResponse.toString());
    //   return mapResponse;

  var  response = await Dio()
              .get(
            "https://api.instantwebtools.net/v1/passenger?${q.map((e) => e).toList().join('&')}",
            queryParameters: {},
            options: Options(
                headers: {},
                validateStatus: (int? status) =>
                    status! >= 200 && status <= 500),
          );
    // dynamic response = await DioApi.sendDioApiRequest(
    //   url:
    //       "https://api.instantwebtools.net/v1/passenger?${q.map((e) => e).toList().join('&')}",
    //   methodType: 'GET',
    //   dioHeaders: headers,
    // );
    // log(response);

    return response.data;
  }
}
