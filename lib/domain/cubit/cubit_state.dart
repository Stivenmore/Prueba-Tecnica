part of 'cubit_cubit.dart';

@immutable
abstract class CubitState {
  const CubitState();
}

class CubitInitial extends CubitState {
  const CubitInitial();
}

class CubitLoading extends CubitState {}

class CubitLoaded extends CubitState {
  final data;

  CubitLoaded(this.data);
}

class CubitError extends CubitState {}
