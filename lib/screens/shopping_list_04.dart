import 'package:code_extract_widget/models/product.dart';
import 'package:code_extract_widget/widgets/item_list_tile_04.dart';
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
    print(_shoppingCart);
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
    print(_shoppingCart);
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: [
          for (final product in widget.products)
            ItemListTile(
              active: !_shoppingCart.contains(product),
              product: product,
              onTap: () {
                print('onTap');
                _handleCartChanged(product, _shoppingCart.contains(product));
              },
            ),
        ],
      ),
    );
  }
}
