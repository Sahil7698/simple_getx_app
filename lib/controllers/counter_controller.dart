import 'package:get/get.dart';
import 'package:simple_getx_app/models/counter_model.dart';

class CounterController extends GetxController {
  CounterModel counterModel = CounterModel(counter: 0);

  void increment() {
    counterModel.counter++;
    update();
  }
}
