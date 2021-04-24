import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pruebatecnica/domain/entities/shopping.dart';

part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  ShoppingCubit() : super(ShoppingLoading());

  Future<void> addShopping ()async{
    
  }
}
