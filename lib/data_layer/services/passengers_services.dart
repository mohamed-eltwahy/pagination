import 'dart:developer';

import 'package:dio/dio.dart';

class PassengersService {
  static const FETCH_LIMIT = 7;
static dynamic getallpassengers(int page) async {
 try {
        Response response = await Dio().get('https://api.instantwebtools.net/v1/passenger?page=$page&size=$FETCH_LIMIT');

        log('response data ${response.data.toString()}' );
        return response.data;
      } catch (e) {
        log(e.toString());
        return {};
      }
  }
  
}