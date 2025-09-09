class AuthStates {
  AuthStates({this.ispasswordVisible = false});
  AuthStates copyWith({bool? ispasswordVisible}) {
    return AuthStates(
      ispasswordVisible: ispasswordVisible ?? this.ispasswordVisible,
    );
  }

  final bool ispasswordVisible;
}
