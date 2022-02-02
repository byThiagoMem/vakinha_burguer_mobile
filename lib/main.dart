import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'app/core/bindings/application_binding.dart';
import 'app/core/ui/vakinha_ui.dart';
import 'app/routes/auth_routers.dart';
import 'app/routes/splash_routers.dart';

void main() {
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
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
      ],
    );
  }
}
