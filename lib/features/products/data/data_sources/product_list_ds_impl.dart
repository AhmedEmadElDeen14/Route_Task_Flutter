import 'package:dartz/dartz.dart';
import 'package:route_task_flutter/core/api/api_manager.dart';
import 'package:route_task_flutter/core/api/end_points.dart';
import 'package:route_task_flutter/core/errors/failure.dart';
import 'package:route_task_flutter/features/products/data/data_sources/product_list_ds.dart';
import 'package:route_task_flutter/features/products/data/models/product_model.dart';

class ProductRemoteDSImpl implements ProductRemoteDS {
  ApiManager apiManager;

  ProductRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      var response = await apiManager.getData(EndPoints.productList);

      ProductModel productModel = ProductModel.fromJson(response.data);
      ;
      return Right(productModel);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }
}
