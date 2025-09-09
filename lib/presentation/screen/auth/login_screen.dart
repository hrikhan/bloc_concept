import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor_management_system/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:tutor_management_system/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:tutor_management_system/presentation/bloc/auth_bloc/auth_states.dart';
import 'package:tutor_management_system/presentation/screen/bottom_navbar/bottom_navabae.dart';
import 'package:tutor_management_system/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:tutor_management_system/presentation/widgets/custom_widgets/custom_textfeild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown.shade100, // solid brown background
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tutor Management',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50.h),

                // Email TextField
                const CustomTextField(
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 20.h),

                // Password TextField
                BlocBuilder<AuthBloc, AuthStates>(
                  builder: (context, state) {
                    return CustomTextField(
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: !state.ispasswordVisible,
                      suffixIcon: state.ispasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    );
                  },
                ),
                SizedBox(height: 40.h),

                // Login Button
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavabarpage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- Custom TextField ----------------
