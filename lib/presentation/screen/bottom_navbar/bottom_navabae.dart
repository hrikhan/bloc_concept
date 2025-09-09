import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor_management_system/presentation/bloc/bottom_navbar_bloc/bottom_navbar_event.dart';
import 'package:tutor_management_system/presentation/bloc/bottom_navbar_bloc/bottom_navbar_states.dart';
import 'package:tutor_management_system/presentation/bloc/bottom_navbar_bloc/bottomnavbar_bloc.dart';
import 'package:tutor_management_system/presentation/screen/home_screen/home_screen.dart';

class BottomNavabarpage extends StatelessWidget {
  const BottomNavabarpage({super.key});

  final List<Widget> _pages = const [HomeScreen(), SearchPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
            body: _pages[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              selectedItemColor: Colors.brown.shade700,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                context.read<BottomNavBloc>().add(ChangeTab(index));
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Example Pages

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Search"));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Profile"));
}
