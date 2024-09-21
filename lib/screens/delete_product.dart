// delete_product.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> deleteProduct(BuildContext context, String productId) async {
  Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/639da5960817590a4e4fd53c/$productId');

  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product deleted successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete product: ${response.statusCode}')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Network error, please try again')),
    );
  }
}
