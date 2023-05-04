import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductController extends GetxController {
  RxList addedProducts = [].obs;

  get totalQuantity => addedProducts.length;

  get totalPrice {
    double totalPrice = 0;

    addedProducts.forEach((e) {
      totalPrice += e.price;
    });

    return totalPrice;
  }

  void addProduct({required ProductModel product}) {
    addedProducts.add(product);
    update();
  }

  void removeProduct({required ProductModel product}) {
    addedProducts.remove(product);
    update();
  }
}
