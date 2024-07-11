import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_task_flutter/core/api/api_manager.dart';
import 'package:route_task_flutter/core/utils/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task_flutter/features/products/data/data_sources/product_list_ds_impl.dart';
import 'package:route_task_flutter/features/products/data/repositories/product_list_repo_impl.dart';
import 'package:route_task_flutter/features/products/domain/use_cases/get_product_list_use_case.dart';
import 'package:route_task_flutter/features/products/presentation/bloc/product_list_bloc.dart';
import 'package:route_task_flutter/features/products/presentation/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListBloc(
        getProductListUseCase: GetProductListUseCase(
          ProductListRepoImpl(
            ProductRemoteDSImpl(
              ApiManager(),
            ),
          ),
        ),
      )..add(ProductListEvent()),
      child: BlocConsumer<ProductListBloc, ProductListState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.failure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? "An error occurred."),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              toolbarHeight: 90.h,
              backgroundColor: Colors.transparent,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage("assets/images/logo.png"),
                    height: 22.h,
                    width: 66.w,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 46.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: AppColors.blueColor),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.blueColor,
                                size: 30,
                              ),
                              hintText: 'what do you search for?',
                              hintStyle: GoogleFonts.poppins(
                                color: AppColors.fontColor.withOpacity(.6),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.blueColor,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(10.w.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (192 / 237),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                ),
                itemBuilder: (context, index) {
                  return ProductItem(products: state.productModel!.products![index]);
                },
                itemCount: state.productModel?.products?.length ?? 0,
              ),
            ),
          );
        },
      ),
    );
  }
}
