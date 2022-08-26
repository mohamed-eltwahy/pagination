import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_flutter/app.dart';
import 'package:pagination_flutter/app_bloc_observer.dart';

// void main() {
//   runApp( MyApp());
// }

 main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(() {
    runApp( MyApp());
  }, blocObserver: MyBlocObserver());

   
}
