import 'package:dartz/dartz.dart';
import 'package:route_task_flutter/core/errors/failure.dart';
import 'package:route_task_flutter/features/products/data/models/product_model.dart';
import 'package:route_task_flutter/features/products/domain/repositories/product_list_repo.dart';

class GetProductListUseCase {
  ProductListRepo productListRepo;

  GetProductListUseCase(this.productListRepo);

  Future<Either<Failures, ProductModel>> call() =>
      productListRepo.getProductList();
}
