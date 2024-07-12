import 'package:dartz/dartz.dart';
import 'package:route_task_flutter/core/errors/failure.dart';
import 'package:route_task_flutter/features/products/data/data_sources/product_list_ds.dart';
import 'package:route_task_flutter/features/products/data/models/product_model.dart';
import 'package:route_task_flutter/features/products/domain/repositories/product_list_repo.dart';

class ProductListRepoImpl implements ProductListRepo {
  ProductRemoteDS productRemoteDS;

  ProductListRepoImpl(this.productRemoteDS);

  @override
  Future<Either<Failures, ProductModel>> getProductList() =>
      productRemoteDS.getProducts();
}
