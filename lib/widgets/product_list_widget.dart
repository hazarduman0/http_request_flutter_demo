import 'package:flutter/material.dart';
import 'package:http_demo_1/models/product.dart';

class ProductListWidget extends StatefulWidget {
  final List<Product> products;
  const ProductListWidget({Key? key, required this.products}) : super(key: key);

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  // List<Product> _products = [];
  // @override
  // void initState() {
  //   _products = widget.products;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.products.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(widget.products[index].productName),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), color: Colors.deepOrangeAccent,
                      ),
                      
                );
              }),
        ),
      ),
    );
  }
}
