part of 'pagination_cubit.dart';

@immutable
abstract class PaginationState {}

class PaginationInitial extends PaginationState {}
class ListLoadingStatus extends PaginationState {}
class LoadingPaginationListState extends PaginationState {}
class ListLoadedSuccessfllyStatus extends PaginationState {}
