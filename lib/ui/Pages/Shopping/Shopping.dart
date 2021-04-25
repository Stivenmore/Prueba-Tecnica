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
      child: Scaffold(
          backgroundColor: Color(0xffEDEEF0),
          appBar: AppBar(
            backgroundColor: Color(0xffEDEEF0),
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: () => Navigator.of(context).pop()),
            actions: [
              TextButton(
                  onPressed: () {
                    context.read<ShoppingCubit>().deletedata();
                  },
                  child: Text('Comprar'))
            ],
          ),
          body: BlocBuilder<ShoppingCubit, ShoppingState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case ShoppingInitial:
                  return Center(
                    child: Text('Vacio'),
                  );
                  break;
                case ShoppingLoaded:
                  return CartLoaded(size);
                  break;
                case ShoppingError:
                  return Center(
                    child: Text('Lo sentimos, tenemos un error'),
                  );
                  break;
                case ShoppingSuccess:
                  return Center(
                    child: Text('Vacio'),
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

  ListView CartLoaded(Size size) {
    return ListView(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Cart',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffE97510),
                          fontFamily: 'Oswald'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                      height: size.height * 0.88,
                      child: BlocBuilder<ShoppingCubit, ShoppingState>(
                          builder: (context, state) => (state
                                  is ShoppingLoaded)
                              ? ListView(
                                  scrollDirection: Axis.vertical,
                                  children: state.shopping
                                      .map((e) => Padding(
                                            padding: EdgeInsets.only(
                                              top: (e == state.shopping.first
                                                  ? 0
                                                  : 10),
                                            ),
                                            child: Modelointerno(
                                              shopping: e,
                                              size: size,
                                            ),
                                          ))
                                      .toList(),
                                )
                              : Center(
                                  child: Text('Sin Productos'),
                                )),
                    )
                  ],
                );
  }
}

class Modelointerno extends StatefulWidget {
  final Size size;
  final shopping;
  const Modelointerno({
    Key key,
    @required this.shopping,
    this.size,
  }) : super(key: key);

  @override
  _ModelointernoState createState() => _ModelointernoState();
}

class _ModelointernoState extends State<Modelointerno> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.shopping.urlimage),
                        fit: BoxFit.cover)),
                height: 120,
                width: widget.size.width * 0.5,
              ),
              Text(widget.shopping.nameproduct, style: TextStyle(fontSize: 18)),
            ],
          ),
          Container(
            width: widget.size.width * 0.5,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Price ' + widget.shopping.price.toString() + '€' + '  ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w700),
                    ),
                    Text('€',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xffE97510),
                          fontWeight: FontWeight.w700,
                        )),
                    Text(
                        (widget.shopping.price -
                                (widget.shopping.price *
                                    (widget.shopping.discout / 100)))
                            .toString(),
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xffE97510),
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.remove),
                        // ignore: unnecessary_statements
                        onPressed: () {
                          widget.shopping.canti--;
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${widget.shopping.canti}'),
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          widget.shopping.canti++;
                        })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
