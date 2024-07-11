import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_task_flutter/core/utils/app_colors.dart';
import 'package:route_task_flutter/core/utils/styles.dart';
import 'package:route_task_flutter/features/products/data/models/ProductModel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductItem extends StatelessWidget {
  final Products? products;

  const ProductItem({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 2.w, color: AppColors.blueColor),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: products!.images![0],
                      fit: BoxFit.fill,
                      width: double.infinity,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline, size: 40),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(2.h.w),
                          margin: EdgeInsets.only(left: 6.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Icon(
                            Icons.favorite_outline,
                            color: AppColors.blueColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    products!.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: BodyTextStyle.fontNormal,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    Text(
                      "EGP ${products?.price}",
                      style: BodyTextStyle.fontNormal,
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      "${((((products?.discountPercentage ?? 0) / 100) * (products!.price ?? 0)) + products!.price!).round()} EGP",
                      style: BodyTextStyle.fontNormal.copyWith(
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w, bottom: 13.h, right: 8.w),
                  child: Row(
                    children: [
                      Text(
                        "Review",
                        style: BodyTextStyle.fontNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "(${products!.rating})",
                        style: BodyTextStyle.fontNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(5.w.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: AppColors.blueColor),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
