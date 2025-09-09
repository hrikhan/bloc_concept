import 'package:flutter/material.dart';
import 'package:tutor_management_system/model/course_model.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              course.imageUrl,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              course.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
