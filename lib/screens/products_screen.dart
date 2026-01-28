 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(252, 104, 104, 145),
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Product>>(
        
        future: ApiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
                color: const Color.fromARGB(190, 164, 140, 163),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: product.thumbnail != null
                      ? Image.network(
                          product.thumbnail!,
                          width: 60,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox(width: 60),
                  title: Text(product.title ?? 'null'),
                  subtitle: Text('Rating: ${product.rating ?? 0}'),

                ),
              );
            },
          );
        },
      ),
    );
  }
}
