import '../../../../Core/Erorrs/Erorrs.dart';
import 'package:dartz/dartz.dart';
import '../entites/Product.dart';

abstract class ProductRepository {
  Future<Either<Errors, List<Product>>> getAllProducts();
  Future<Either<Errors, Unit>> deleteProduct(int prodid);
  Future<Either<Errors, Unit>> updateProducts(Product product);
  Future<Either<Errors, Unit>> addProducts(Product product);
}
