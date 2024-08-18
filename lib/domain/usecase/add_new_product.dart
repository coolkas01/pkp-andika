import '/domain/entity/product.dart';
import '/domain/repository/product_repository.dart';

class AddNewProduct {
  AddNewProduct({required ProductRepository repo})
      : _repo = repo;

  final ProductRepository _repo;

  Future<void> call(Product product) =>
      _repo.create(product);
}