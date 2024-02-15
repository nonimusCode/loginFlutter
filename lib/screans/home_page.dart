import 'package:flutter/material.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({Key? key}) : super(key: key);

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos Tienda'), // tittle to the title
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildProductCard('calamar', 'assets/calamar.png'),
            _buildProductCard('chuleta', 'assets/chuleta.jpg'),
            _buildProductCard('frisby', 'assets/frisby.jpg'),
            _buildProductCard('hamburguesa', 'assets/hamburguesa.png'),
            _buildProductCard('salchipapas', 'assets/salchipapas.jpg'),
            _buildProductCard('sushi', 'assets/sushi.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String productName, String srcPath) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 180,
        height: 180,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                srcPath,
                fit: BoxFit.contain,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    productName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
