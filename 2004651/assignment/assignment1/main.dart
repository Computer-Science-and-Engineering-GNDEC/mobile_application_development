import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'common/routes/pages.dart';
import 'common/style/theme.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const FlutterTalk ());
}

class FlutterTalk extends StatelessWidget {
  const FlutterTalk({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 780),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.light,
        // color: AppColors.primaryElement,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        // getPages: AppPages.routes,
      ),
    );
  }
}
