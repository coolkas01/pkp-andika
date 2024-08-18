import '/data/source/remote/api.dart';
import '/domain/entity/product.dart';
import '/domain/repository/product_repository.dart';
import 'dto/product_dto.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required Api api})
      : _api = api;

  final Api _api;

  @override
  Future<Products> fetchAll() =>
      _api.fetchAll();

  @override
  Future<void> create(Product product) {
    final data = ProductDTO(id: product.id, name: product.name, data: product.data);
    return _api.create(data);
  }
}