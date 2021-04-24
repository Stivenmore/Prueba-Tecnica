import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:pruebatecnica/data/repositories/repositories.dart';
import 'package:pruebatecnica/data/repositories/services/services.dart';
import 'package:pruebatecnica/domain/entities/product.dart';

part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  final Repository _repository;

  CubitCubit({Repository repository})
      : _repository = repository ?? Repository(FirebaseFirestore.instance),
        super(CubitLoading());
  final List<Product> product = [];

  Future<void> getdata() async {
    ServiceResult<List<Product>> result =
        await _repository.getDatafromFirebase();

    if (result.data != null) {
      emit(CubitLoaded(product: result.data));
    } else {
      emit(CubitError(result.message));
    }
  }
}
