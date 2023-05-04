import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_getx_app/controllers/product_controller.dart';

import '../../res/all_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.changeTheme(
                ThemeData.light(),
              );
            },
            icon: const Icon(Icons.light_mode),
          ),
          IconButton(
            onPressed: () {
              Get.changeTheme(
                ThemeData.dark(),
              );
            },
            icon: Icon(Icons.dark_mode),
          ),
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed('/cart_page');
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
                GetX<ProductController>(builder: (pc) {
                  return Text("${productController.totalQuantity}");
                })
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: allProduct.length,
        itemBuilder: (context, i) => Card(
          elevation: 3,
          child: ListTile(
            isThreeLine: true,
            leading: Text("${i + 1}"),
            title: Text(allProduct[i].name),
            subtitle:
                Text("${allProduct[i].category}\nRS. ${allProduct[i].price}"),
            trailing: IconButton(
              onPressed: () {
                productController.addProduct(product: allProduct[i]);
              },
              icon: const Icon(Icons.add_shopping_cart),
            ),
          ),
        ),
      ),
    );
  }
}
