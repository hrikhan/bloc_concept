import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor_management_system/model/course_model.dart';
import 'package:tutor_management_system/model/student_model.dart';
import 'package:tutor_management_system/model/techer_model.dart';
import 'package:tutor_management_system/presentation/bloc/home_bloc/home_staes.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchHomeData>((event, emit) async {
      emit(HomeLoading());
      try {
        // Simulate API call
        await Future.delayed(const Duration(seconds: 1));

        // Students list
        List<Student> students = [
          Student(id: '1', name: 'Alice'),
          Student(id: '2', name: 'Bob'),
          Student(id: '3', name: 'Charlie'),
          Student(id: '4', name: 'Diana'),
          Student(id: '5', name: 'Ethan'),
          Student(id: '6', name: 'Fiona'),
          Student(id: '7', name: 'George'),
          Student(id: '8', name: 'Hannah'),
        ];

        // Top Rated Teachers
        List<Teacher> topRatedTeachers = [
          Teacher(
            id: '1',
            name: 'Mr. John',
            rating: 4.8,
            imageUrl: 'https://i.pravatar.cc/150?img=1',
          ),
          Teacher(
            id: '2',
            name: 'Ms. Emma',
            rating: 4.7,
            imageUrl: 'https://i.pravatar.cc/150?img=2',
          ),
          Teacher(
            id: '3',
            name: 'Mr. Michael',
            rating: 4.9,
            imageUrl: 'https://i.pravatar.cc/150?img=5',
          ),
          Teacher(
            id: '4',
            name: 'Ms. Olivia',
            rating: 4.6,
            imageUrl: 'https://i.pravatar.cc/150?img=6',
          ),
        ];

        // For You Teachers
        List<Teacher> forYouTeachers = [
          Teacher(
            id: '5',
            name: 'Mr. Smith',
            rating: 4.6,
            imageUrl: 'https://i.pravatar.cc/150?img=3',
          ),
          Teacher(
            id: '6',
            name: 'Ms. Lily',
            rating: 4.5,
            imageUrl: 'https://i.pravatar.cc/150?img=4',
          ),
          Teacher(
            id: '7',
            name: 'Mr. Daniel',
            rating: 4.7,
            imageUrl: 'https://i.pravatar.cc/150?img=7',
          ),
          Teacher(
            id: '8',
            name: 'Ms. Sophia',
            rating: 4.8,
            imageUrl: 'https://i.pravatar.cc/150?img=8',
          ),
        ];

        // Courses
        List<Course> courses = [
          Course(
            id: '1',
            title: 'Flutter Basics',
            imageUrl: 'https://picsum.photos/200',
          ),
          Course(
            id: '2',
            title: 'Advanced Python',
            imageUrl: 'https://picsum.photos/201',
          ),
          Course(
            id: '3',
            title: 'Data Science 101',
            imageUrl: 'https://picsum.photos/202',
          ),
          Course(
            id: '4',
            title: 'UI/UX Design',
            imageUrl: 'https://picsum.photos/203',
          ),
          Course(
            id: '5',
            title: 'JavaScript Essentials',
            imageUrl: 'https://picsum.photos/204',
          ),
          Course(
            id: '6',
            title: 'React Native',
            imageUrl: 'https://picsum.photos/205',
          ),
        ];

        emit(
          HomeLoaded(
            students: students,
            topRatedTeachers: topRatedTeachers,
            forYouTeachers: forYouTeachers,
            courses: courses,
          ),
        );
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
