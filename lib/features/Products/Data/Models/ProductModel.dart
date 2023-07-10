import '../../logic/entites/Product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.ImageUrl,
  });

  factory ProductModel.fromjson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        ImageUrl: json['thumbnail'],
      );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'thumbnail': ImageUrl,
    };
  }
}
