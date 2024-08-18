import '/domain/entity/product.dart';

class ProductDTO extends Product {
  ProductDTO({
    required super.id,
    required super.name,
    super.data,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      ProductDTO(
        id: json['id'],
        name: json['name'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'data': data,
  };
}