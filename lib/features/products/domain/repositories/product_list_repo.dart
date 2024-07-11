import 'package:dartz/dartz.dart';
import 'package:route_task_flutter/core/errors/failure.dart';
import 'package:route_task_flutter/features/products/data/models/ProductModel.dart';

abstract class ProductListRepo {
  Future<Either<Failures, ProductModel>> getProductList();
}