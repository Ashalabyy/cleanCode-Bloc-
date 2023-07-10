import 'package:cubit/features/Products/logic/useCases/Getall_Products.dart';
import 'package:flutter/material.dart';
import './features/Products/Persentation/Pages/ProductsPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Injection_Container.dart' as di;
import './features/Products/Persentation/bloc/Products/products_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (_) => di.sl<ProductsBloc>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductsPage(),
      ),
    );
  }
}
