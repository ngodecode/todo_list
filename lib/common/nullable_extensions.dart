extension NullableInt on int? {
  int orZero() => this ?? 0;
}

extension NullableDouble on double? {
  double orZero() => this ?? 0;
}

extension NullableString on String? {
  String orEmpty() => this ?? "";
}
