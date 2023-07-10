import 'dart:convert';
import 'dart:io';
import 'package:cubit/Core/Erorrs/Exceptions.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:http/http.dart' as http;
import '../Models/ProductModel.dart';
import 'package:dartz/dartz.dart';

import '../Models/Products.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<Unit> deleteProduct(int id);
  Future<Unit> addProduct(ProductModel prodModel);
  Future<Unit> updateProduct(ProductModel prodModel);
}

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  final BASE_URL = "https://dummyjson.com";
  Map<String, String> GET_HEADERS = {
    'Content-Type': 'application/json',
    'method': 'GET'
  };
  Map<String, String> POST_HEADERS = {
    'Content-Type': 'application/json',
    'method': 'POST'
  };
  Map<String, String> DELETE_HEADERS = {
    'Content-Type': 'application/json',
    'method': 'DELETE'
  };
  Map<String, String> PATCH_HEADERS = {
    'Content-Type': 'application/json',
    'method': 'PATCH'
  };
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await http.get(
      Uri.parse(BASE_URL + '/products'),
      headers: GET_HEADERS,
    );

    if (response.statusCode == 200) {
      final result = await jsonDecode(response.body) as Map<String, dynamic>;
      Products newProducts = Products.fromJson(result);
      List<ProductModel> parsedProducts =
          newProducts.products.map((e) => ProductModel.fromjson(e)).toList();

      return parsedProducts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addProduct(ProductModel prodModel) async {
    final Productmodel = ProductModel(
      id: prodModel.id,
      title: prodModel.title,
      price: prodModel.price,
      description: prodModel.description,
      ImageUrl: prodModel.ImageUrl,
    );
    final JsonFormat = Productmodel.toJson();
    final response = await http.post(
      Uri.parse(BASE_URL + '/products'),
      headers: POST_HEADERS,
      body: JsonFormat,
    );
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteProduct(int id) async {
    final response =
        await http.delete(Uri.parse(BASE_URL + '/products/${id.toString()}'));
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateProduct(ProductModel prodModel) async {
    final productid = prodModel.id.toString();
    final Productmodel = ProductModel(
      id: prodModel.id,
      title: prodModel.title,
      price: prodModel.price,
      description: prodModel.description,
      ImageUrl: prodModel.ImageUrl,
    );
    final JsonFormat = Productmodel.toJson();
    final response = await http.patch(
      Uri.parse(BASE_URL + '/products/$productid'),
      body: JsonFormat,
      headers: PATCH_HEADERS,
    );
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
