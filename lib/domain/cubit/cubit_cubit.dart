import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:pruebatecnica/data/repositories/repositories.dart';

part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  final Repository _repository;

  CubitCubit({Repository repository})
      : _repository = repository ?? Repository(FirebaseFirestore.instance),
        super(CubitInitial());

  Future getdata() async {
    emit(CubitLoading());
    try {
      final data = _repository.getData();
      emit(CubitLoaded(data));
    } catch (e) {
      print(e.toString());
      emit(CubitError());
    }
  }
}
