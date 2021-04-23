
import 'package:flutter/material.dart';

class ListProduts extends StatefulWidget {
  final data;
  ListProduts({Key key, @required this.data}) : super(key: key);

  @override
  _ListProdutsState createState() => _ListProdutsState();
}

class _ListProdutsState extends State<ListProduts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Tenemos data'),
      ),
    );
  }
}
