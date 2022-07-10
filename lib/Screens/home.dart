import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_flutter/Bloc/cubit/pagination_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  fetchData() async {
    var cubit = PaginationCubit.get(context);
    if (cubit.page != cubit.lastPage) {
      cubit.page++;
      log(cubit.page.toString());
      cubit.getAllData(page: cubit.page, size: 10);
    }
  }

  // @override
  // void initState() {
  //   PaginationCubit.get(context).getAllData(page: 0,size: 10);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PaginationCubit, PaginationState>(
      builder: (BuildContext context, state) {
        var cubit = PaginationCubit.get(context);
        cubit.total = cubit.allmodeldata?.totalPassengers ?? 1;
        cubit.lastPage = cubit.allmodeldata?.totalPages ?? 1;
        return state is ListLoadingStatus
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  ListView.separated(
                    itemCount: cubit.listpagination!.length,
                    controller: scrollController,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(
                        cubit.listpagination![index].name.toString(),
                        style: const TextStyle(fontSize: 20),
                      ));
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: state is LoadingPaginationListState ? 70 : 0,
                      width: double.infinity,
                      color: Colors.black,
                      child: Center(
                        child: cubit.total == cubit.listpagination!.length
                            ? const Text("No More Data")
                            : const CircularProgressIndicator(),
                      ),
                    ),
                  )
                ],
              );
      },
      listener: (BuildContext context, Object? state) {},
    ));
  }
}
