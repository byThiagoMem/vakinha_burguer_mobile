import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/modules/product_details/product_details_bindings.dart';
import 'package:vakinha_burguer_mobile/app/modules/product_details/product_details_page.dart';

class ProductRouters {
  ProductRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/product_detail',
      binding: ProductDetailsBindings(),
      page: () => const ProductDetailsPage(),
    ),
  ];
}
