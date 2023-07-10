part of 'add_delete_update_products_bloc.dart';

abstract class AddDeleteUpdateProductsEvent extends Equatable {
  const AddDeleteUpdateProductsEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends AddDeleteUpdateProductsEvent {}

class UpdateProductEvent extends AddDeleteUpdateProductsEvent {}

class DeleteProductEvent extends AddDeleteUpdateProductsEvent {}
