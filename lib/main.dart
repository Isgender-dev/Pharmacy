import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy/constants/constants.dart';
import 'package:get/get.dart';
import 'package:pharmacy/views/entrypoint.dart';

Widget defaultHome = MainScreen();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    //  designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pharmacy',
          theme: _buildTheme(),
          home: defaultHome,
        );
      },
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: kPrimary,
            selectionColor: kPrimaryLight,
            cursorColor: kPrimary
          ),
          scaffoldBackgroundColor: kOffWhite,
          iconTheme: const IconThemeData(color: kDark),
          primarySwatch: Colors.grey,
        );
  }
}
