import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor_management_system/model/techer_model.dart';

class TeacherCard extends StatelessWidget {
  final Teacher teacher;
  const TeacherCard({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              teacher.imageUrl,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  teacher.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(teacher.rating.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
