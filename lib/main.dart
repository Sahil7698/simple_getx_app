import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_getx_app/view/screens/cart_page.dart';
import 'package:simple_getx_app/view/screens/home_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/cart_page',
          page: () => CartPage(),
        ),
      ],
    ),
  );
}
