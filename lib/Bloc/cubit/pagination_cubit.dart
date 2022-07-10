import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pagination_flutter/Repositories/paginate_repo.dart';

import '../../models/pagination_model.dart';

part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit() : super(PaginationInitial());
  static PaginationCubit get(context) => BlocProvider.of(context);
  int page = 0;
  int lastPage = 1;
  int total = 1;
  List<Data>? listpagination = [];

  PaginationModel? allmodeldata;

  dynamic getAllData({int? page, int? size}) async {
    if (page == 0) {
      listpagination = [];

      emit(ListLoadingStatus());
    } else {
      emit(LoadingPaginationListState());
    }
    dynamic res = await PaginateRepo.getAllData(
        query: {"page": page.toString(), "size": size.toString()});
    allmodeldata = PaginationModel.fromJson(res);

    emit(ListLoadedSuccessfllyStatus());
  }
}
