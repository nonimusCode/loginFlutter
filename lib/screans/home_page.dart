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
        width: 250,
        height: 250,
        //GestureDetector onlockPress, 
        child: GestureDetector(
          //onTap llama a una funcion (){} presiones o seleccion de la img
          onTap: (){
            //showDialog funcion para mostrar una ventana Modal o poPap  
            showDialog(
              context: context, 
              //Dialog widget para personalizar o pasar contenido
              builder: (_)=>Dialog(
                child: _showDialogCostome(productName, srcPath)
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
      ),
    );
  }

   Widget _showDialogCostome(String productName, String srcPath) {
    return Container( 
      height: 300,
      width: 400,

    child: Column(
      children: [
        Image.asset(srcPath),
        Center(
          child: 
          Padding(padding: const EdgeInsets.all(17.0),
          child: 
          Text(productName, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold) )
          ),
        )
        
      ],
    ),
    );
   }
}
