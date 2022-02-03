import 'package:get/get.dart';
import './product_details_controller.dart';

class ProductDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailsController(shoppingCardService: Get.find()));
  }
}
