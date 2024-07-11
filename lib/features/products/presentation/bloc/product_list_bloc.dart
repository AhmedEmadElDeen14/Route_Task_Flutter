import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_task_flutter/core/errors/failure.dart';
import 'package:route_task_flutter/features/products/data/models/ProductModel.dart';
import 'package:route_task_flutter/features/products/domain/use_cases/get_product_list_use_case.dart';

part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  GetProductListUseCase getProductListUseCase;

  ProductListBloc({
    required this.getProductListUseCase,
  }) : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) async {
      emit(state.copyWith(screenStatus: ScreenStatus.loading));
      var res = await getProductListUseCase.call();
      res.fold((l) {
        emit(state.copyWith(screenStatus: ScreenStatus.failure, failures: l));
      }, (r) {
        emit(state.copyWith(
            screenStatus: ScreenStatus.success, productModel: r));
      });
    });
  }
}
