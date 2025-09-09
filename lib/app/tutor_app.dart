import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor_management_system/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:tutor_management_system/presentation/screen/auth/login_screen.dart';

class TutorApp extends StatelessWidget {
  const TutorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => child!,
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [BlocProvider<AuthBloc>(create: (context) => AuthBloc())],
        child: MaterialApp(
          title: 'Tutor Management System',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.brown,
            scaffoldBackgroundColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const LoginScreen(), // Starting point of your app
          // You can add named routes later
          // routes: {
          //   '/home': (context) => const HomeScreen(),
          //   '/tutorList': (context) => const TutorListScreen(),
          // },
        ),
      ),
    );
  }
}
