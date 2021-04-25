import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/domain/bloc/Shopping/cubit/shopping_cubit.dart';

class ShoppingCard extends StatefulWidget {
  ShoppingCard({Key key}) : super(key: key);

  @override
  _ShoppingCardState createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(body: BlocBuilder<ShoppingCubit, ShoppingState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case ShoppingInitial:
              return Center(
                child: Text('Vacio'),
              );
              break;
            case ShoppingLoaded:
              return Column(
                children: [
                  
                ],
              );
              break;
            case ShoppingError:
              return Center(
                child: Text('Estado Error'),
              );
              break;
            case ShoppingSuccess:
              return Center(
                child: Text('Estado Success'),
              );
              break;
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      )),
    );
  }
}
