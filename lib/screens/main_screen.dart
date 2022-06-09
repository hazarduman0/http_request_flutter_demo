import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo_1/data/data.api/category_api.dart';
import 'package:http_demo_1/data/data.api/product_api.dart';
import 'package:http_demo_1/models/category.dart';
import 'package:http_demo_1/models/product.dart';
import 'package:http_demo_1/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> categories = [];
  List<Widget> categoryWidgets = [];
  List<Product> products = [];

  @override
  void initState() {
    getCategoriesFromApi();
    // print('categories');
    // print(categories);
    // print('categoryWidgets');
    // print(categoryWidgets);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alışveriş Sistemi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(
              products: products,
            )
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCatergories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        //gelen response nin datasını map formatına çeker.
        /*
        itrable, koleksiyonların iterator ile kullanılmasına olanak sağlayan bir sınıftır. 
        iterator, koleksiyon içindeki elemanlar arasında bağımsız gezebilme olanağı sağlar. 
        böylelikle dizilerde normalde birkaç adımda yapmamız gereken işlemi 
        iterator ile tek bir method ile yapabiliriz. örneğin; son elemanın değerini almak gibi.
        */
        categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();     
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextButton(
          style: TextButton.styleFrom(
            elevation: 1.0,
            primary: Colors.white,
            minimumSize: const Size(88, 44),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            getProductByCategoryId(category);
          },
          child: Text(
            category.categoryName,
            style: const TextStyle(color: Colors.blueGrey),
          )),
    );
  }

  void getProductByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      if (mounted) {
        setState(() {
          Iterable list = json.decode(response.body);
          products = list.map((product) => Product.fromJson(product)).toList();
        });
      }
      print(products);
    });
  }
}
