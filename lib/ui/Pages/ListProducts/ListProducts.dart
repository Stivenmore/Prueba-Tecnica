import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/domain/bloc/Listcubit/cubit_cubit.dart';
import 'package:pruebatecnica/domain/entities/product.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEDEEF0),
      body: BlocBuilder<CubitCubit, CubitState>(
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
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(Icons.shopping_bag_outlined),
                          onPressed: () {})
                    ],
                  ),
                  Center(
                      child: Text('Training',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ))),
                  SizedBox(
                    height: size.height * 0.83,
                    child: BlocBuilder<CubitCubit, CubitState>(
                        builder: (context, state) => (state is CubitLoaded)
                            ? ListView(
                                scrollDirection: Axis.vertical,
                                children: state.product
                                    .map((e) => Padding(
                                          padding: EdgeInsets.only(top: (e == state.product.first? 0 : 10), left: 10),
                                          child: Column(
                                            children: [
                                              ProductCard(
                                                product: e,
                                                size: size,
                                              ),
                                              DetailProduct(
                                                product: e,
                                                size: size,
                                              )
                                            ],
                                          ),
                                        ))
                                    .toList())
                            : Center(
                                child: Text('No tenemos productos',
                                    style: TextStyle(fontSize: 18)),
                              )),
                  )
                ],
              );
              break;
            default:
              return Center(
                child: Text('Error desconocido'),
              );
          }
        },
      ),
    );
  }
}

class DetailProduct extends StatelessWidget {
  final Size size;
  final Product product;
  const DetailProduct({
    Key key,
    this.size,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Table(
            children: [
              TableRow(children: [
                Row(
                  children: [
                    Text(product.nameproduct,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Oswald')),
                  ],
                ),
              ]),
              TableRow(children: [
                Row(
                  children: [
                    Text(
                      'Price ' + product.price.toString() + '€' + '  ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                        (product.price -
                                (product.price * (product.discout / 100)))
                            .toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffE97510),
                          fontWeight: FontWeight.w700,
                        ))
                  ],
                )
              ]),
              TableRow(
                children: [
                  Row(
                    children: [
                      Text('Discout of ', style: TextStyle(color: Colors.grey),),
                      Text(product.discout.toString()+'%', style: TextStyle(fontWeight: FontWeight.w700),)
                    ],
                  )
                ]
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Size size;
  final Product product;
  const ProductCard({
    Key key,
    this.product,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(product.urlimage), fit: BoxFit.cover)),
      height: 207,
      width: size.width * 0.9,
    );
  }
}
