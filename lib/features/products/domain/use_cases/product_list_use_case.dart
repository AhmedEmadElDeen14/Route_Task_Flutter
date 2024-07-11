import 'package:dartz/dartz.dart';
import 'package:route_task_flutter/core/errors/failure.dart';
import 'package:route_task_flutter/features/products/data/models/ProductModel.dart';
import 'package:route_task_flutter/features/products/domain/repositories/product_list_repo.dart';

class ProductListUseCase {
  ProductListRepo productListRepo;

  ProductListUseCase(this.productListRepo);

  Future<Either<Failures, ProductModel>> call() =>
      productListRepo.getProductList();
}
