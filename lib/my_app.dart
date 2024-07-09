import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task_flutter/features/products/presentation/pages/product_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductListScreen(),
        );
      },
    );
  }
}
