import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pruebatecnica/data/repositories/repositories.dart';
import 'package:pruebatecnica/data/repositories/services/services.dart';
import 'package:pruebatecnica/domain/entities/product.dart';
import 'package:pruebatecnica/domain/entities/shopping.dart';

part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  final Repository _repository;

  ShoppingCubit({Repository repository})
      : _repository = repository ?? Repository(FirebaseFirestore.instance),
        super((ShoppingInitial()));

  Future<void> addShopping(Product product) async {
    ServiceResult<List<Product>> result =
        await _repository.setData(product: product);
    if (result.status != false) {
      emit(ShoppingSuccess(result.message));
      print('agregado con existo');
    } else {
      emit(ShoppingError(result.message));
      print('Intentelo mas tarde');
    }
  }

  Future<void> getdatashopping() async {
    ServiceResult<List<Shopping>> result = await _repository.getdatashopping();

    if (result.data != null) {
      emit(ShoppingLoaded(shopping: result.data));
    } else if (result.status == true) {
      emit(ShoppingInitial());
    } else {
      emit(ShoppingError(result.message));
    }
  }

  Future<void> deletedata() async {
     ServiceResult<List<Shopping>> result = await _repository.delete();
    if (result.status == true) {
       emit(ShoppingSuccess(result.message));
    } else {
      emit(ShoppingError(result.message));
    }
  }
}
