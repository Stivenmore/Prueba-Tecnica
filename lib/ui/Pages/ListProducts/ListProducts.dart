import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/domain/bloc/Listcubit/cubit_cubit.dart';

class ListProduts extends StatefulWidget {
  ListProduts({
    Key key,
  }) : super(key: key);

  @override
  _ListProdutsState createState() => _ListProdutsState();
}

class _ListProdutsState extends State<ListProduts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CubitCubit, CubitState>(
      builder: (_, state) {
        print(state);
        switch (state.runtimeType) {
          case CubitLoading:
            return Center(
              child: Text('Cubit Loading'),
            );
            break;
          case CubitError:
            return Center(
              child: Text('Cubit Error'),
            );
            break;
          case CubitLoaded:
            return Center(
              child: Text('Cubit Loaded'),
            );
            break;
          default:
          return Center(
          child: Text('No CubitLoaded'),
        );
        }
      },
    ));
  }
}
