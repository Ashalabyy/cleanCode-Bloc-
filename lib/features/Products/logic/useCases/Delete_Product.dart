import 'package:dartz/dartz.dart';
import '../../../../Core/Erorrs/Erorrs.dart';
import '../Repositiories/Product_Repostiory.dart';

class DeleteProductUseCase {
  ProductRepository repository;
  DeleteProductUseCase(this.repository);

  Future<Either<Errors, Unit>> call(int id) async {
    return await repository.deleteProduct(id);
  }
}
