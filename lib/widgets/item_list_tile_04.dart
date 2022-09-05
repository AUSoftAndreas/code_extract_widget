import 'package:code_extract_widget/models/product.dart';
import 'package:code_extract_widget/widgets/item_text_03.dart';
import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  const ItemListTile({
    Key? key,
    required this.active,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  final bool active;
  final Product product;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: !active ? Colors.black54 : Theme.of(context).primaryColor,
        child: Text(product.name[0]),
      ),
      title: ItemText(
        product: product,
        active: active,
      ),
    );
  }
}
