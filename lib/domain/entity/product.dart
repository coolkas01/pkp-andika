typedef Products = List<Product>;

class Product {
  const Product({
    required this.id,
    required this.name,
    this.data,
  });

  final String id;
  final String name;
  final Map<String, dynamic>? data;
}

extension MapExt on Map<String, dynamic> {
  String get asText =>
      entries.map((e) => '${e.key}: ${e.value}').join('\n');
}