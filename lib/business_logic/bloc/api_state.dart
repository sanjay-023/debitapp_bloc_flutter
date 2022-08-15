part of 'api_bloc.dart';

@immutable
abstract class ApiState {}

class ApiLoadingState extends ApiState {}

class ApiErrorState extends ApiState {
  final String errorMessage;

  ApiErrorState(this.errorMessage);
}

class ApiSuccessState extends ApiState {
  final List<Datum> data;

  ApiSuccessState(this.data);
}
