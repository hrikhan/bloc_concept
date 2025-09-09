import 'package:flutter/material.dart';
import 'package:tutor_management_system/model/student_model.dart';

class StudentCard extends StatelessWidget {
  final Student student;
  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.shade200.withOpacity(0.6),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular Avatar
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              "https://mintbook.com/blog/wp-content/uploads/2020-10-27_125911.jpg",
            ),
            backgroundColor: Colors.brown.shade200.withOpacity(0.5),
          ),
          const SizedBox(height: 10),
          // Student Name
          Text(
            student.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
