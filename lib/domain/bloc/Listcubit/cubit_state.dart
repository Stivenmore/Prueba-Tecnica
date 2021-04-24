part of 'cubit_cubit.dart';

@immutable
abstract class CubitState extends Equatable {
  const CubitState();
  @override
  List<Object> get props => [];
}

class CubitLoading extends CubitState {
  List<Object> get props => [];
}

class CubitLoaded extends CubitState {
  final List<Product> product;

  CubitLoaded({this.product});
  
  @override
  List<Object> get props => [product];
}

// ignore: must_be_immutable
class CubitError extends CubitState {
  String message;
  CubitError(this.message);
  @override
  List<Object> get props => [message];
}
