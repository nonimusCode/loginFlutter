import 'package:flutter/material.dart';

class MenuDesk extends StatefulWidget {
  const MenuDesk({super.key});

  @override
  State<MenuDesk> createState() => _MenuDeskState();
}

class _MenuDeskState extends State<MenuDesk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network('https://github.com/images/modules/search/mona-love-2x.png'),
          ),
          title: const Text('Aplicación'),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            _buildProductCard('Ostras', 'assets/calamar.png'),
            _buildProductCard('chuleta', 'assets/chuleta.jpg'),
           // _buildProductCard('frisby', 'assets/frisby.jpg'),
            //_buildProductCard('hamburguesa', 'assets/hamburguesa.png'),
            //_buildProductCard('salchipapas', 'assets/salchipapas.jpg'),
            //_buildProductCard('sushi', 'assets/sushi.jpg'),
          
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
        child: GestureDetector(
          onTap: (){
            showDialog(
              context: context, 
              builder: (_)=>Dialog(
                child: _showDialogCostome(productName, srcPath),
              ) 
              );
          },
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
                      padding:EdgeInsets.all(8.0),
                      child: Text(
                        productName,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      ),
                  )
              ],
            ),
          ),
        ),
      ),
      );
  }
  Widget _showDialogCostome(String productName, String srcPath){
    return Container(
      height: 300,
      width: 400,

      child: Column(
        children: [
          Image.asset(srcPath),
          Center(
            child: 
            Padding(padding: EdgeInsets.all(17.0),
            child:
            Text(productName, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold) )
            ),
          )
        ],
        ),
    );
  }
}
