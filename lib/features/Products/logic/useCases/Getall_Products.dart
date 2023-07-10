import 'package:dartz/dartz.dart';
import '../entites/Product.dart';
import '../../../../Core/Erorrs/Erorrs.dart';
import '../Repositiories/Product_Repostiory.dart';

class GetallProductsUseCase {
  ProductRepository repository;
  GetallProductsUseCase(this.repository);

  Future<Either<Errors, List<Product>>> call() async {
    return await repository.getAllProducts();
  }
}
