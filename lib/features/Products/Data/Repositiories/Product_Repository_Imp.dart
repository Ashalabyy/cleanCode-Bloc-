import 'package:cubit/Core/Erorrs/Exceptions.dart';

import 'package:cubit/features/Products/Data/DataSources/Product_Remote_DataSource.dart';
import 'package:cubit/features/Products/Data/Models/ProductModel.dart';
import 'package:dartz/dartz.dart';
import 'package:cubit/features/Products/logic/entites/Product.dart';
import 'package:cubit/Core/Erorrs/Erorrs.dart';
import 'package:flutter/cupertino.dart';
import '../../logic/Repositiories/Product_Repostiory.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Errors, List<Product>>> getAllProducts() async {
    try {
      final remoteproducts = await remoteDataSource.getAllProducts();
      return Right(remoteproducts);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<Errors, Unit>> addProducts(Product product) async {
    final Productmodel = ProductModel(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      ImageUrl: product.ImageUrl,
    );
    try {
      final remoteproducts = await remoteDataSource.addProduct(Productmodel);
      return Right(remoteproducts);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<Errors, Unit>> updateProducts(Product product) async {
    final Productmodel = ProductModel(
      id: product.id,
      title: product.title,
      price: product.price,
      description: product.description,
      ImageUrl: product.ImageUrl,
    );
    try {
      final remoteproducts = await remoteDataSource.updateProduct(Productmodel);
      return Right(remoteproducts);
    } on ServerException {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<Errors, Unit>> deleteProduct(int prodid) async {
    try {
      final remoteproducts = await remoteDataSource.deleteProduct(prodid);
      return Right(remoteproducts);
    } on ServerException {
      return Left(ServerError());
    }
  }
}
