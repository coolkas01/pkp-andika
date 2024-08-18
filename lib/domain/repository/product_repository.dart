import '../entity/product.dart';

abstract class ProductRepository {
  Future<Products> fetchAll();

  // Future<Product> fetchById(String id);

  Future<void> create(Product product);

  // Future<bool> update();
  //
  // Future<bool> delete();
}