part of 'passengers_cubit_cubit.dart';

@immutable
abstract class PassengersCubitState {}

class PassengersCubitInitial extends PassengersCubitState {}
class LoadingAlldataState extends PassengersCubitState {}
class ListLoaded extends PassengersCubitState {
 final List<Data> listpassengers;

  ListLoaded(this.listpassengers);
}

class ListLoading extends PassengersCubitState {
  final List<Data> oldPassengers;
  final bool isFirstFetch;

  ListLoading(this.oldPassengers, {this.isFirstFetch=false});
}
