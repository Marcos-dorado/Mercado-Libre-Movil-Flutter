import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/productos.dart';


class Productos extends StatelessWidget {
  const Productos({super.key});

  Future<List<Product>> obtenerProductos() async {
    return await consultarProducto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Product>>(
        future: obtenerProductos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay productos disponibles.'));
          } else {
            final productos = snapshot.data!;
            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final producto = productos[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4), 
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Icon(Icons.shopping_bag, color: Colors.lightBlue, size: 40),
                    title: Text(
                      producto.nombre,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      'Precio: \$${producto.precio}\nCategoría: ${producto.categoria.nombre}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    onTap: () {
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
