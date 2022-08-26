import 'package:pagination_flutter/data_layer/models/passengersmodel.dart';

import '../services/passengers_services.dart';

class PassengersRepo {

 static dynamic fetchPassengers(int page) async {
    final news = await PassengersService.getallpassengers(page);
     (news as List<dynamic>)
        .map<Data>(
            (n) => Data.fromJson(n))
        .toList();
    return news.map((e) => Data.fromJson(e)).toList();
  }
  
}
