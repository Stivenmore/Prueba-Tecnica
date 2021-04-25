import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/dependency/register.dart';
import 'package:pruebatecnica/domain/bloc/Listcubit/cubit_cubit.dart';
import 'package:pruebatecnica/domain/bloc/Shopping/cubit/shopping_cubit.dart';
import 'package:pruebatecnica/ui/Pages/Splash/Splash.dart';

Future<void> main() async {
  Register().regist();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CubitCubit()),
        BlocProvider(create: (context) => ShoppingCubit())
        ], 
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Prueba Tecnica',
          theme: ThemeData(
            accentColor: Colors.white
          ),
          home: Home()
      ),
    );
  }
}
