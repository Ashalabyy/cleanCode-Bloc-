import 'package:dartz/dartz.dart';
import '../entites/Product.dart';
import '../../../../Core/Erorrs/Erorrs.dart';
import '../Repositiories/Product_Repostiory.dart';

class UpdateProductsUseCase {
  ProductRepository repository;
  UpdateProductsUseCase(this.repository);

  Future<Either<Errors, Unit>> call(Product product) async {
    return await repository.updateProducts(product);
  }
}
