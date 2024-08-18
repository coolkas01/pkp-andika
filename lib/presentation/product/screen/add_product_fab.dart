import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/domain/entity/product.dart';
import '../providers.dart';

class AddProductFAB extends ConsumerWidget {
  AddProductFAB({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) =>
              AlertDialog(
                title: const Text('Add new product'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter product name';
                          }
                          if (text.length < 10) {
                            return 'Product name must have at least 10 characters';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: priceController,
                        decoration: const InputDecoration(
                          labelText: 'Price',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter product price';
                          }
                          if ((int.tryParse(text) ?? 0) < 1) {
                            return 'Please enter a valid price';
                          }
                          return null;
                        },
                      ),

                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      final product = Product(
                        id: '0',
                        name: nameController.text,
                        data: {'Price': priceController.text},
                      );
                      ref.read(addNewProductProvider.call(product));
                      ref.invalidate(fetchAllProductsProvider);
                      Navigator.of(_).pop();
                    },
                    child: const Text('Add'),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(_).pop(),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
        );
      },
      child: const Icon(Icons.add),
    );
  }

}