import 'package:flutter/material.dart';

class Productoshogar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos de Hogar'),
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(products[index]['icon'], size: 40.0),
              title: Text(products[index]['name']),
              subtitle: Text(products[index]['price']),
            ),
          );
        },
      ),
    );
  }
}

final List<Map<String, dynamic>> products = [
  {'name': 'Aspiradora Robot', 'price': '\$800.000', 'icon': Icons.home},
  {'name': 'Licuadora de Alta Potencia', 'price': '\$400.000', 'icon': Icons.kitchen},
  {'name': 'Set de Ollas y Sartenes', 'price': '\$1.200.000', 'icon': Icons.local_dining},
  {'name': 'Mesa de Centro Moderna', 'price': '\$600.000', 'icon': Icons.weekend},
  {'name': 'Lámpara LED de Pie', 'price': '\$250.000', 'icon': Icons.lightbulb_outline},
];
