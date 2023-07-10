import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_delete_update_products_event.dart';
part 'add_delete_update_products_state.dart';

class AddDeleteUpdateProductsBloc extends Bloc<AddDeleteUpdateProductsEvent, AddDeleteUpdateProductsState> {
  AddDeleteUpdateProductsBloc() : super(AddDeleteUpdateProductsInitial()) {
    on<AddDeleteUpdateProductsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
