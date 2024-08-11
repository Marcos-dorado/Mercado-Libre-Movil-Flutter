import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/consultarCategorias.dart';
import 'package:flutter_application_1/src/screens/Productos.dart';

class Menuprincipal extends StatelessWidget {
  const Menuprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsController controller = ProductsController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mercado Libre"),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue[400],
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Iniciar Sesión'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Registrarse'),
              onTap: () {
                Navigator.pushNamed(context, '/registro');
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Usuarios'),
              onTap: () {
                Navigator.pushNamed(context, '/users');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Buscar',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey[200]),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.production_quantity_limits_rounded)),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/perfil');
                    },
                    icon: Icon(Icons.person)),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: FutureBuilder<List<Categorie>>(
                future: controller.consultarCategoria(), 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No hay categorías disponibles'));
                  } else {
                    final categories = snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        IconData categoryIcon;
                        switch (categories[index].nombre.toLowerCase()) {
                          case 'electrodomésticos':
                            categoryIcon = Icons.devices;
                            break;
                          case 'muebles':
                            categoryIcon = Icons.chair;
                            break;
                          case 'ropa':
                            categoryIcon = Icons.checkroom;
                            break;
                          default:
                            categoryIcon = Icons.category;
                        }

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Productos(
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[400],
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  categoryIcon,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  categories[index].nombre,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30.0, color: Colors.lightBlue[400]),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify_outlined,
                size: 30.0, color: Colors.lightBlue[400]),
            label: 'Compra',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app,
                size: 30.0, color: Colors.lightBlue[400]),
            label: 'Salir',
          ),
        ],
      ),
    );
  }
}