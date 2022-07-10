import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_flutter/Bloc/cubit/pagination_cubit.dart';
import 'package:pagination_flutter/Screens/home.dart';
import 'package:pagination_flutter/app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(() {
    runApp(
      const MyApp(),
    );
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PaginationCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Pagination',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
