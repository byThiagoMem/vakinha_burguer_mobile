import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_rounded_button.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevation;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;
  final bool calculateTotal;
  const PlusMinusBox({
    Key? key,
    required this.price,
    required this.minusCallback,
    required this.plusCallback,
    required this.quantity,
    this.elevation = false,
    this.backgroundColor,
    this.label,
    this.calculateTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: const TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                VakinhaRoundedButton(label: '-', onPressed: minusCallback),
                Text('$quantity'),
                VakinhaRoundedButton(label: '+', onPressed: plusCallback),
              ],
            ),
            Visibility(visible: label == null, child: const Spacer()),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 10),
              constraints: const BoxConstraints(minWidth: 70),
              child: Text(FormatterHelper.formatCurrency(
                  calculateTotal ? price * quantity : price)),
            ),
          ],
        ),
      ),
    );
  }
}
