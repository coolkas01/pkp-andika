import '/domain/entity/product.dart';
import '/domain/repository/product_repository.dart';

class FetchAllProducts {
  FetchAllProducts({required ProductRepository repo})
      : _repo = repo;

  final ProductRepository _repo;

  Future<Products> call() =>
      _repo.fetchAll();
}