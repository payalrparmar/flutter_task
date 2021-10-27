import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/bloc/prod_bloc.dart';
import 'package:flutter_task/bloc/product_bloc.dart';
import 'package:flutter_task/bloc/variant.dart';
import 'package:flutter_task/model/categories.dart';
import 'package:flutter_task/model/prodoo.dart';
import 'package:flutter_task/model/product_details_response.dart';
import 'package:flutter_task/model/products.dart';
import 'package:flutter_task/model/sub_prod.dart';
import 'package:flutter_task/model/variants_bloc.dart';
import 'package:flutter_task/model/variants_bloc.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //ProductBloc? _bloc;
  ProdBloc? _blocc;
  VariantBloc? _bloc;
  @override
  void initState() {
    super.initState();
    _blocc = ProdBloc();
    _bloc = VariantBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: StreamBuilder<Prodoo>(
            stream: _blocc!.allEnquiryController.stream,
            //stream: _blocc!.allEnquiryController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.variants!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Container(
                          width: 20,
                          height: 30,
                          color: Colors.yellow,
                          child: Column(
                            children: [
                              Text(snapshot.data!.variants![index].color!),
                              // Text(snapshot.data!.variants![index].price
                              //     .toString()),
                              // Text(snapshot.data!.variants![index].color
                              //     .toString()),
                            ],
                          ),
                        ),

                        // trailing: Text(
                        //     snapshot.data!.rankings![index].ranking ?? ""),
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
