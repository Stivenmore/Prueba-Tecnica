import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injector/injector.dart';
import 'package:pruebatecnica/data/repositories/repositories.dart';
import 'package:pruebatecnica/domain/cubit/cubit_cubit.dart';

class Register {
  void regist() {
    final injector = Injector.appInstance;

    injector.registerDependency<Repository>(() {
      final repository = Repository(FirebaseFirestore.instance);

      return repository;
    });
    injector.registerSingleton<CubitCubit>(() => CubitCubit());
  }
}
