import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/product_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                GetBuilder<ProductController>(builder: (pc) {
                  return Text(
                      "Total Quantity: ${productController.totalQuantity}");
                }),
                GetBuilder<ProductController>(builder: (pc) {
                  return Text("Total Price: ${productController.totalPrice}");
                }),
              ],
            ),
          ),
          Expanded(
            flex: 12,
            child: GetBuilder<ProductController>(builder: (pc) {
              return ListView.builder(
                  itemCount: productController.addedProducts.length,
                  itemBuilder: (context, i) {
                    List data = productController.addedProducts;
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        isThreeLine: true,
                        leading: Text("${i + 1}"),
                        title: Text("${data[i].name}"),
                        subtitle:
                            Text("${data[i].category}\nRs. ${data[i].price}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_shopping_cart_outlined),
                          onPressed: () {
                            productController.removeProduct(product: data[i]);
                          },
                        ),
                      ),
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
