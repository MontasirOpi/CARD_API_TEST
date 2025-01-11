import 'package:card_app/models/product.dart';
import 'package:card_app/screens/delete_product.dart';
import 'package:card_app/screens/edit_product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      title: Text(widget.product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${widget.product.productCode}'),
          Text('Price: \$${widget.product.unitPrice}'),
          Text('Quantity: ${widget.product.quantity}'),
          Text('Total Price: \$${widget.product.totalPrice}'),
          const Divider(),
          OverflowBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProductScreen(product: widget.product),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              TextButton.icon(
                onPressed: () {
                  deleteProduct(context, widget.product.id);
                },
                icon: const Icon(Icons.delete_outline),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
