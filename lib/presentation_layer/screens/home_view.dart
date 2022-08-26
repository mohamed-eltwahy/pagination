import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../businessLogic_layer/cubit/passengers_cubit_cubit.dart';
import '../../data_layer/models/passengersmodel.dart';
import '../widgets/news_item.dart';

class HomePage extends StatelessWidget {
  final scrollController = ScrollController();

  HomePage({Key? key}) : super(key: key);

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PassengersCubitCubit>(context).loadNews();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<PassengersCubitCubit>(context).loadNews();

    return Scaffold(
      body: _postList(),
    );
  }

  Widget _postList() {
    return BlocBuilder<PassengersCubitCubit, PassengersCubitState>(
        builder: (context, state) {
      if (state is ListLoading && state.isFirstFetch) {
        return _loadingIndicator();
      }

      List<Data> list = [];
      bool isLoading = false;

      if (state is ListLoading) {
        list = state.oldPassengers;
        isLoading = true;
      } else if (state is ListLoaded) {
        list = state.listpassengers;
      }

      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < list.length) {
            return NewsItem(
              listpass: list[index],
            );
          } else {
            Timer(const Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });

            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: list.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
