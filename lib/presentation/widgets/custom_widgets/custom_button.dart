// ---------------- Custom Button ----------------
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        gradient: LinearGradient(
          colors: [Colors.brown.shade600, Colors.brown.shade500],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.r),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
