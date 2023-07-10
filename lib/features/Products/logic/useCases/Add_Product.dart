import 'package:cubit/features/Products/logic/entites/Product.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/Erorrs/Erorrs.dart';
import '../Repositiories/Product_Repostiory.dart';

class AddProductUseCase {
  ProductRepository repository;
  AddProductUseCase(this.repository);

  Future<Either<Errors, Unit>> call(Product product) async {
    return await repository.addProducts(product);
  }
}
