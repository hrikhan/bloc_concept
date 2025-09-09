import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor_management_system/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:tutor_management_system/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:tutor_management_system/presentation/bloc/auth_bloc/auth_states.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final IconData? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthStates>(
      builder: (context, state) {
        return TextField(
          obscureText: obscureText,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.brown.shade600.withOpacity(
              0.25,
            ), // subtle translucent
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white70, fontSize: 16.sp),
            prefixIcon: Icon(prefixIcon, color: Colors.white, size: 22.sp),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon, color: Colors.white, size: 22.sp),
                    onPressed: () {
                      context.read<AuthBloc>().add(TogglePasswordVisibility());
                    },
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(
              vertical: 18.h,
              horizontal: 20.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
    );
  }
}
