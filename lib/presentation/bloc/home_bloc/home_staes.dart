import 'package:tutor_management_system/model/course_model.dart';
import 'package:tutor_management_system/model/student_model.dart';
import 'package:tutor_management_system/model/techer_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Student> students;
  final List<Teacher> topRatedTeachers;
  final List<Teacher> forYouTeachers;
  final List<Course> courses;

  HomeLoaded({
    required this.students,
    required this.topRatedTeachers,
    required this.forYouTeachers,
    required this.courses,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
