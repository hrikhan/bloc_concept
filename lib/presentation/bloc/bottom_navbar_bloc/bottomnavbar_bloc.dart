import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutor_management_system/presentation/bloc/bottom_navbar_bloc/bottom_navbar_event.dart';
import 'package:tutor_management_system/presentation/bloc/bottom_navbar_bloc/bottom_navbar_states.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial()) {
    on<ChangeTab>((event, emit) => emit(BottomNavUpdated(event.index)));
  }
}
