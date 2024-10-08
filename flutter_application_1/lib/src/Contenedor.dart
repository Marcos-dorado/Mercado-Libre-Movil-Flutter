import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screens/MenuPrincipal.dart';
import 'package:flutter_application_1/src/screens/Productos.dart';
import 'package:flutter_application_1/src/screens/login.dart';
import 'package:flutter_application_1/src/screens/AdminUsers.dart';
import 'package:flutter_application_1/src/screens/registerUsuario.dart';

class APP extends StatelessWidget {
  const APP ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mercado Libre",
      home: Menuprincipal(),
      routes: {
        '/home': (context) => Menuprincipal(),
        '/login': (context) => Login(),
        '/registro': (context) => PaginadeRegistro(),
        // '/productosHogar' : (context) => Productoshogar(),
        '/users' : (context) => MenuUsers(),
        //'/modalUsers' : (context) => ModalConsultarUsuarios(context),
        //'modalUsers' : (context) => modalEvenentos

        '/productos' : (context) => Productos(),
      },
    );
  }
}
