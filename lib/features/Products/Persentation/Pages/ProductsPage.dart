import 'package:cubit/Core/widgets/StaticWidgets.dart';
import 'package:cubit/features/Products/Persentation/Widgets/CustomProductList.dart';
import 'package:cubit/features/Products/Persentation/bloc/Products/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Products',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      bloc: context.read<ProductsBloc>()..add(GetallProducts()),
      builder: (context, state) {
        if (state is LoadingProductsState) {
          return StaticWidgets.CustomCirlce();
        } else if (state is LoadedProductsState) {
          return CustomProductList(
            productlist: state.products,
          );
        } else if (state is ErorrProductsState) {
          return Text('erorrr');
        }
        return Container(
          color: Colors.red,
        );
      },
    );
  }
}
