import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import './product_details_controller.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://dartweek.academiadoflutter.com.br/images${controller.product.image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(controller.product.description,
                        style: context.textTheme.bodyText2),
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    return PlusMinusBox(
                      minusCallback: () => controller.removeProduct(),
                      plusCallback: () => controller.addProduct(),
                      quantity: controller.quantity,
                      price: controller.product.price,
                    );
                  }),
                  const Divider(),
                  Obx(
                    () {
                      return ListTile(
                        title: const Text(
                          'Total',
                          style: VakinhaUI.textBold,
                        ),
                        trailing: Text(
                          FormatterHelper.formatCurrency(controller.totalPrice),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: context.widthTransformer(reducedBy: 10),
                      child: VakinhaButton(
                        label:
                            controller.alreadyAdded ? 'ATUALIZAR' : 'ADICIONAR',
                        onPressed: controller.addProductInShoppingCard,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
