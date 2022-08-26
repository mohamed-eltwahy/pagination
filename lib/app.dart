import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_flutter/presentation_layer/screens/home_view.dart';
import 'businessLogic_layer/cubit/passengers_cubit_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => PassengersCubitCubit()),
        ),
       
      ],
      child: MaterialApp(
        title: 'Flutter Pagination',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          timePickerTheme: TimePickerThemeData(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            hourMinuteShape: const CircleBorder(),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          }),
        ),
        home: HomePage(),
      ),
    );
  }
}
