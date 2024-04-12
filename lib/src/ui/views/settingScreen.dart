import 'package:flutter/material.dart';
import 'package:proyecto_mvc/src/model/product.dart';
import 'package:proyecto_mvc/src/service/product_service.dart';

class Settings extends StatelessWidget {
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: FutureBuilder<List<Product>?>(
        future: _productService.list(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final Product product = snapshot.data![index];
                return ListTile(
                  leading: Text("prueba"),
                  title: Text(product.title),
                  subtitle: Text('Precio: \$${product.price.toString()}'),
                );
              },
            );
          } else {
            return Center(child: Text('No se encontraron productos'));
          }
        },
      ),
    );
  }
}