import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Map<String, dynamic>? selectedProduct;

  @override
  void initState() {
    super.initState();
    loadSelectedProduct();
  }

  Future<void> loadSelectedProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productJson = prefs.getString('selected_product');
    if (productJson != null) {
      setState(() {
        selectedProduct = jsonDecode(productJson);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: selectedProduct != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedProduct!['title']),
                  Text('\$${selectedProduct!['price']}'),
                  Image.network(selectedProduct!['image']),
                ],
              ),
            )
          : Center(
              child: Text('No product selected'),
            ),
    );
  }
}
