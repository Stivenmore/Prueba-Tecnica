import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:pruebatecnica/data/repositories/repositories.dart';
import 'package:pruebatecnica/dependency/register.dart';
import 'package:pruebatecnica/domain/cubit/cubit_cubit.dart';
import 'package:pruebatecnica/ui/Pages/ListProducts/ListProducts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Register().regist();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Tecnica',
      theme: ThemeData(),
      home: BlocProvider.value(
        value: Injector.appInstance.get<CubitCubit>(),
        child: ListProduts(),
      ),
    );
  }
}
