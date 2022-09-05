import 'package:code_extract_widget/models/product.dart';
import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, super.key});
  final List<Product> products;
  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: [
          for (final product in widget.products)
            ListTile(
              onTap: () {
                _handleCartChanged(product, _shoppingCart.contains(product));
              },
              leading: CircleAvatar(
                backgroundColor: _shoppingCart.contains(product) ? Colors.black54 : Theme.of(context).primaryColor,
                child: Text(product.name[0]),
              ),
              title: ItemText(
                product: product,
                active: !_shoppingCart.contains(product),
              ),
            ),
        ],
      ),
    );
  }
}

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
