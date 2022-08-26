import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data_layer/models/passengersmodel.dart';
import '../../data_layer/repositories/passengers_repo.dart';

part 'passengers_cubit_state.dart';

class PassengersCubitCubit extends Cubit<PassengersCubitState> {
  PassengersCubitCubit() : super(PassengersCubitInitial());

      static PassengersCubitCubit get(context) => BlocProvider.of(context);

  int page = 1;

  void loadNews() {
    if (state is ListLoading) return;

    final currentState = state;

    var oldPosts = <Data>[];
    if (currentState is ListLoaded) {
      oldPosts = currentState.listpassengers;
    }

    emit(ListLoading(oldPosts, isFirstFetch: page == 1));

    PassengersRepo.fetchPassengers(page).then((newPosts) {
      page++;

      final posts = (state as ListLoading).oldPassengers;
      posts.addAll(newPosts);    

      emit(ListLoaded(posts));
    });
  }
}
