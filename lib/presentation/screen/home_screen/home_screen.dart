import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor_management_system/core/constant/text.dart';
import 'package:tutor_management_system/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:tutor_management_system/presentation/bloc/home_bloc/home_event.dart';
import 'package:tutor_management_system/presentation/bloc/home_bloc/home_staes.dart';
import 'package:tutor_management_system/presentation/bloc/video_bloc/event.dart';
import 'package:tutor_management_system/presentation/bloc/video_bloc/videobloc.dart';
import 'package:tutor_management_system/presentation/bloc/video_bloc/video_state.dart';
import 'package:tutor_management_system/presentation/screen/home_screen/home_screen_widget/course_card.dart';
import 'package:tutor_management_system/presentation/screen/home_screen/home_screen_widget/student_card.dart';
import 'package:tutor_management_system/presentation/screen/home_screen/home_screen_widget/techer_card.dart';
import 'package:tutor_management_system/presentation/screen/home_screen/home_screen_widget/video_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()..add(FetchHomeData())),
        BlocProvider(create: (_) => VideoBloc()..add(LoadVideos())),
      ],
      child: Scaffold(
        backgroundColor: Colors.brown.shade100,
        body: Column(
          children: [
            // ---------- Custom AppBar ----------
            Container(
              padding: EdgeInsets.only(
                top: 40.h,
                left: 16.w,
                right: 16.w,
                bottom: 16.h,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.brown.shade700, Colors.brown.shade500],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tutor App',
                        style: AppTextStyles.heading2(color: Colors.white),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Welcome, Hridoy Khan',
                        style: AppTextStyles.subtitle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      CircleAvatar(
                        radius: 22.r,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?img=5',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ---------- Body ----------
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ---------- Video Section ----------
                          BlocBuilder<VideoBloc, VideoState>(
                            builder: (context, videoState) {
                              if (videoState.loading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return SizedBox(
                                height: 220.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: videoState.videos.length,
                                  itemBuilder: (context, index) {
                                    final video = videoState.videos[index];
                                    final controller =
                                        videoState.controllers[index]!;
                                    return Padding(
                                      padding: EdgeInsets.only(right: 12.w),
                                      child: VideoCard(
                                        video: video,
                                        controller: controller,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 16.h),
                          Text(
                            "Top Rated Teachers",
                            style: AppTextStyles.heading3(),
                          ),
                          SizedBox(
                            height: 180.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.topRatedTeachers.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: TeacherCard(
                                  teacher: state.topRatedTeachers[index],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 16.h),
                          Text(
                            "Popular Students",
                            style: AppTextStyles.heading3(),
                          ),
                          SizedBox(
                            height: 140.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.students.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: StudentCard(
                                  student: state.students[index],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 16.h),
                          Text("Courses", style: AppTextStyles.heading3()),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.w,
                                  mainAxisSpacing: 12.h,
                                  childAspectRatio: 0.85,
                                ),
                            itemCount: state.courses.length,
                            itemBuilder: (context, index) =>
                                CourseCard(course: state.courses[index]),
                          ),
                        ],
                      ),
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text("Error: ${state.message}"));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
