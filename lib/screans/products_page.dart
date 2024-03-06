import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/screans/login2_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/screans/product_detail_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      setState(() {
        products = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

Future<void> logout()async{
  SharedPreferences shared = await SharedPreferences.getInstance();
  //tenemos shared una instancia de todo nuestro SharedPreference
  shared.remove("login");
   Navigator.pushReplacement(
        // Esto reemplaza la pantalla actual por la nueva
        context,
        MaterialPageRoute(builder: (context) => StartPage()),
      ); 
}

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: (){
              logout();
            }
          )
          ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              // Guardar información del producto en SharedPreferences
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('selected_product', jsonEncode(products[index]));

              // Redirigir a otra página
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailPage()),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(products[index]['title']),
                subtitle: Text('\$${products[index]['price']}'),
                leading: Image.network(products[index]['image']),
              ),
            ),
          );
        },
      ),
    );
  }
}
