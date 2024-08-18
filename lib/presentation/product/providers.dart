import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/data/product_repository_impl.dart';
import '/data/source/remote/api.dart';
import '/domain/entity/product.dart';
import '/domain/usecase/fetch_all_products.dart';
import '/domain/usecase/add_new_product.dart';

// Data
final apiProvider = Provider((_) => ApiImpl());

// Domain
final productRepositoryProvider = Provider((ref) =>
    ProductRepositoryImpl(api: ref.read(apiProvider)));

final fetchAllProductsProvider = FutureProvider((ref) =>
    FetchAllProducts(repo: ref.read(productRepositoryProvider)).call());

final addNewProductProvider = FutureProvider.family<void, Product>((ref, product) =>
    AddNewProduct(repo: ref.read(productRepositoryProvider)).call(product));