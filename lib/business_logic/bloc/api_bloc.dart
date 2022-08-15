import 'package:debitapp_bloc/data/models/data_model.dart';
import 'package:debitapp_bloc/data/repository/data_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final DataRepo _dataRepo;
  ApiBloc(this._dataRepo) : super(ApiLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      emit(ApiLoadingState());

      try {
        final data = await _dataRepo.getData();

        emit(ApiSuccessState(data));
      } catch (e) {
        emit(ApiErrorState(e.toString()));
      }
    });
  }
}
