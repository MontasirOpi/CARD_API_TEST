import 'package:card_app/models/product.dart';


import 'package:flutter/material.dart';


class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key, required this.product,
  });
  final Product product;

  @override
  State<ProductItem> createState() => _productItemState();
}

class _productItemState extends State<ProductItem> {
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      title:  Text(widget.product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Product Code: ${widget.product.productCode}'),
           Text('Price: \$${widget.product.unitPrice}'),
           Text('Quantity: ${widget.product.quantity}'),
           Text('Total Price: \$${widget.product.totalPrice}'),
           Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
             TextButton.icon(
                onPressed: () {
               // Pass the product ID
                },
                icon: const Icon(Icons.delete_outline),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ))
            ],
          )
        ],
      ),
    );
  }
  


}


