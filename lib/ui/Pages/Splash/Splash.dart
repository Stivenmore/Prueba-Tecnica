import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pruebatecnica/domain/bloc/Listcubit/cubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/ui/Pages/ListProducts/ListProducts.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final cubit = CubitCubit();

  @override
  void initState() {
    super.initState();
    context.read<CubitCubit>().getdata().whenComplete(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ListProduts()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: size.height,
          width: size.width,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/logo_splash.jpg',
                ),
                const SizedBox(
                  height: 40,
                ),
                CircularProgressIndicator(
                  backgroundColor: Color(0xffE04536),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
