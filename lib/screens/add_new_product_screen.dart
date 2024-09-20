import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _unitePriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  bool _inProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildNewProductForm(),
        ),
      ),
    );
  }

  Widget _buildNewProductForm() {
    return Form(
      key: _fromKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: const InputDecoration(
              hintText: 'Name',
              labelText: 'Product Name',
            ),
            validator: (String? valu) {
              if (valu == null || valu.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _unitePriceTEController,
            decoration: const InputDecoration(
              hintText: 'Unit Price',
              labelText: 'Unit Price',
            ),
            validator: (String? valu) {
              if (valu == null || valu.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
              hintText: 'Total price',
              labelText: 'Total price',
            ),
            validator: (String? valu) {
              if (valu == null || valu.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageTEController,
            decoration: const InputDecoration(
              hintText: 'Product Image',
              labelText: 'Product Image',
            ),
            validator: (String? valu) {
              if (valu == null || valu.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _codeTEController,
            decoration: const InputDecoration(
              hintText: 'Product Code',
              labelText: 'Product Code',
            ),
            validator: (String? valu) {
              if (valu == null || valu.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityTEController,
            decoration: const InputDecoration(
              hintText: 'Quantity',
              labelText: 'Quantity',
            ),
            validator: (String? valu) {
              if (valu == null || valu.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          _inProgress
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(double.maxFinite),
                  ),
                  onPressed: _onTapAppProductButton,
                  child: Text('Add Product'),
                ),
        ],
      ),
    );
  }

  void _onTapAppProductButton() {
    if (_fromKey.currentState!.validate()) {
      addNewProduct();
    }
  }

  Future<void> addNewProduct() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
    Map<String, dynamic> requestBody = {
      "ProductName": _productNameTEController.text,
      "ProductCode": _codeTEController.text,
      "Img": _imageTEController.text,
      "UnitPrice": _unitePriceTEController.text,
      "Qty": _quantityTEController.text,
      "TotalPrice": _totalPriceTEController.text,
    };

    Response response = await post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      _clearTextFields();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('New Product added'),
        ),
      );
    }
    _inProgress = false;
    setState(() {});
  }

  void _clearTextFields() {
    _productNameTEController.clear();
    _quantityTEController.clear();
    _totalPriceTEController.clear();
    _unitePriceTEController.clear();
    _imageTEController.clear();
    _codeTEController.clear();
  }

  @override
  void dispose() {
    _productNameTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _unitePriceTEController.dispose();
    _imageTEController.dispose();
    _codeTEController.dispose();
    super.dispose();
  }
}
