import 'package:debitapp_bloc/data/repository/data_repo.dart';
import 'package:debitapp_bloc/presentation/screens/bottombar/bottombar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return RepositoryProvider(
          create: (_) => DataRepo(),
          child: MaterialApp(
            home: BottomBarView(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
      designSize: const Size(375, 812),
    );
  }
}
