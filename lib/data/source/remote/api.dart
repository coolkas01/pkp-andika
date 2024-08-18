import 'package:dio/dio.dart';
import '/data/source/local/db.dart';
import '/data/dto/logger_dto.dart';
import '/data/dto/product_dto.dart';

abstract class Api {
  Future<List<ProductDTO>> fetchAll();

  Future<ProductDTO> fetchById(String id);

  Future<void> create(ProductDTO product);

  // Future<bool> update();
  //
  // Future<bool> delete();
}

class ApiImpl implements Api {
  final dio = Dio()..interceptors.add(LoggerInterceptor());

  @override
  Future<List<ProductDTO>> fetchAll() async {
    try {
      final resp = await dio.get('https://api.restful-api.dev/objects');
      return (resp.data as List<dynamic>)
          .map((e) => ProductDTO.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductDTO> fetchById(String id) async {
    try {
      final resp = await dio.get('https://api.restful-api.dev/objects/$id');
      return ProductDTO.fromJson(resp.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> create(ProductDTO product) async {
    try {
      final data = product.toJson();
      await dio.post('https://api.restful-api.dev/objects', data: data);
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<bool> delete() {
  //   // TODO: implement delete
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<bool> update() {
  //   // TODO: implement update
  //   throw UnimplementedError();
  // }
}

class LoggerInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    saveResponse(response);
    super.onResponse(response, handler);
  }

  void saveResponse(Response response) async {
    final logger = LoggerDTO(
      method: response.requestOptions.method,
      url: response.realUri.toString(),
      code: response.statusCode ?? 0,
      body: response.data.toString(),
      createdAt: DateTime.now().toString(),
    );
    final db = DbImpl();
    db.save(logger);
  }
}