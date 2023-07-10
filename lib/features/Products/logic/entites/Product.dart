import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final int price;
  final String description;
  final String ImageUrl;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.ImageUrl,
  });

  @override
  List<Object?> get props => [id, title, price, description, ImageUrl];
}
