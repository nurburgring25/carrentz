enum SharedPreferenceKey {
  APPLICATION_MODE,
  SESSION_ID
}

extension SharedPreferenceKeyExtension on SharedPreferenceKey {
  String name() {
    return this.toString();
  }
}

enum ApplicationMode {
  MERCHANT,
  USER
}

extension ModeExtension on ApplicationMode {
  String name() {
    return this.toString();
  }
}