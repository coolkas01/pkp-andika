import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/domain/entity/product.dart';
import '../providers.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(fetchAllProductsProvider).when(
        loading: () =>
        const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) =>
            Center(
              child: Text('Something went wrong: $error'),
            ),
        data: (products) =>
            ListView.builder(
              itemBuilder: (_, i) =>
                  ListTile(
                    title: Text('#${products[i].id} - ${products[i].name}'),
                    subtitle: products[i].data != null
                        ? Text(products[i].data!.asText)
                        : null,
                  ),
              itemCount: products.length,
            ),
      );
}
