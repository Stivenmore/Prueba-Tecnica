import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/domain/cubit/cubit_cubit.dart';

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
    print('Pidiendo data');
    setState(() {
      print('retorno almacenado en data');
    });
    Timer(Duration(milliseconds: 150), () async{
     await cubit.getdata();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<CubitCubit>(
      create: (context) => CubitCubit(),
      child: BlocBuilder<CubitCubit, CubitState>(builder: (context, state) {
        if (state is CubitLoaded) {
          print(state);
        }
        if (state is CubitLoading) {
          print(state);
        }
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
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
