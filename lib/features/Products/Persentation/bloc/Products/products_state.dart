part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class LoadingProductsState extends ProductsState {}

class LoadedProductsState extends ProductsState {
  final List<Product> products;
  LoadedProductsState({required this.products});
  @override
  List<Object> get props => [products];
}

class ErorrProductsState extends ProductsState {
  final String message;
  ErorrProductsState({required this.message});

  @override
  List<Object> get props => [message];
}
