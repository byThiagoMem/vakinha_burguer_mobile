import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/routes/home_routers.dart';
import 'package:vakinha_burguer_mobile/app/routes/product_routers.dart';

import 'app/core/bindings/application_binding.dart';
import 'app/core/ui/vakinha_ui.dart';
import 'app/routes/auth_routers.dart';
import 'app/routes/splash_routers.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      theme: VakinhaUI.theme,
      initialBinding: ApplicationBinding(),
      debugShowCheckedModeBanner: false,
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
      ],
    );
  }
}
