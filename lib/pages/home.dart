import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/bloc/product_bloc.dart';
import 'package:flutter_task/model/categories.dart';
import 'package:flutter_task/model/product_details_response.dart';
import 'package:flutter_task/pages/product.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  static String tag = "home-page";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProductBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProductBloc();
    print("prod......$ProductBloc");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Produts"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: StreamBuilder<ProductDetailsResponse>(
            stream: _bloc!.allEnquiryController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.categories!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          title: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(),
                                ),
                              );
                            },
                            child: Container(
                              width: 20,
                              height: 30,
                              color: Colors.black12,
                              child: Text(
                                  snapshot.data!.categories![index].name ?? ""),
                            ),
                          ),
                          // trailing: Text(
                          //     snapshot.data!.rankings![index].ranking ?? ""),
                        ),
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
