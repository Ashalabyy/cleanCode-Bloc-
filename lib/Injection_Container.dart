import 'package:cubit/features/Products/Data/DataSources/Product_Remote_DataSource.dart';
import 'package:cubit/features/Products/Data/Repositiories/Product_Repository_Imp.dart';
import 'package:cubit/features/Products/Persentation/bloc/Products/products_bloc.dart';
import 'package:cubit/features/Products/logic/Repositiories/Product_Repostiory.dart';
import 'package:cubit/features/Products/logic/useCases/Delete_Product.dart';
import 'package:cubit/features/Products/logic/useCases/Getall_Products.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // FEATURES Products

  // Bloc
  sl.registerFactory(() => ProductsBloc(sl()));
  // UseCases
  sl.registerLazySingleton(() => GetallProductsUseCase(sl()));
  sl.registerLazySingleton(() => DeleteProductUseCase(sl()));
// Repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImp(remoteDataSource: sl()));
//Data Source
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImp());
}
