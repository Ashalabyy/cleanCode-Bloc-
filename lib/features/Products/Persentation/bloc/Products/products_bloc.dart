import 'package:bloc/bloc.dart';
import 'package:cubit/Core/Erorrs/Erorrs.dart';
import 'package:cubit/Core/Strings/Faliure.dart';
import 'package:cubit/features/Products/logic/entites/Product.dart';
import 'package:cubit/features/Products/logic/useCases/Getall_Products.dart';
import 'package:equatable/equatable.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetallProductsUseCase getallProductsUseCase;
  ProductsBloc(this.getallProductsUseCase)
      : super(
          ProductsInitial(),
        ) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetallProducts) {
        emit(
          LoadingProductsState(),
        );
        final faliureOrproducts = await getallProductsUseCase();
        faliureOrproducts.fold(
          (faliure) => {
            emit(ErorrProductsState(message: _mapFaliureToMessage(faliure)))
          },
          (prods) => {
            emit(
              LoadedProductsState(products: prods),
            ),
          },
        );
      }
    });
  }

  String _mapFaliureToMessage(Errors faliure) {
    switch (faliure.runtimeType) {
      case ServerError:
        return SERVER_ERROR;
      case offlineError:
        return OFFLINE_ERROR;
      default:
        return "Unexcpected Error";
    }
  }
}
