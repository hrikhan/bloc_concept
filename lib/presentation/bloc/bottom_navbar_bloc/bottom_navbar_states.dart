abstract class BottomNavState {
  final int selectedIndex;
  const BottomNavState(this.selectedIndex);
}

class BottomNavInitial extends BottomNavState {
  BottomNavInitial() : super(0); // default tab is 0
}

class BottomNavUpdated extends BottomNavState {
  BottomNavUpdated(int index) : super(index);
}
