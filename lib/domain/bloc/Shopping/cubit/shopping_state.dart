part of 'shopping_cubit.dart';

abstract class ShoppingState extends Equatable {
  const ShoppingState();

  @override
  List<Object> get props => [];
}

class ShoppingInitial extends ShoppingState {
  List<Object> get props => [];
}

class ShoppingLoaded extends ShoppingState {
  
  final List<Shopping> shopping;

  ShoppingLoaded({this.shopping});

  @override
  List<Object> get props => [shopping];
}
// ignore: must_be_immutable
class ShoppingSuccess extends ShoppingState {
  String message;
  ShoppingSuccess(this.message);
  @override
  List<Object> get props => [message];
}
// ignore: must_be_immutable
class ShoppingError extends ShoppingState {
  String message;
  ShoppingError(this.message);
  @override
  List<Object> get props => [message];
}
