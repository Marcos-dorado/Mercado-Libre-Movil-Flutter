import 'dart:convert';
import 'package:http/http.dart' as http;


class ProductsController {  
Future<List<Categorie>> consultarCategoria() async {
  final response = await http
      .get(Uri.parse('https://api-nodejs-1-6n9x.onrender.com/api/categorie'));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Categorie.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load categories');
  }
}
}

class Categorie {
  final String codigo;
  final String nombre;

  const Categorie({
    required this.codigo,
    required this.nombre,
  });

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      codigo: json['codigo'] ?? '',
      nombre: json['nombre'] ?? '',
    );
  }
}
