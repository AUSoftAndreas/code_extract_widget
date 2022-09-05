import 'package:code_extract_widget/models/product.dart';
import 'package:flutter/material.dart';

class ItemText extends StatelessWidget {
  const ItemText({
    Key? key,
    required this.product,
    required this.active,
  }) : super(key: key);

  final Product product;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.name,
      style: !active
          ? const TextStyle(
              color: Colors.black54,
              decoration: TextDecoration.lineThrough,
            )
          : const TextStyle(
              color: Colors.black,
            ),
    );
  }
}
