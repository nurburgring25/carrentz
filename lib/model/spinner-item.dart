class SpinnerItem {
  dynamic _identifier;
  String _description;

  SpinnerItem(this._identifier, this._description) {}

  String get description => _description;

  dynamic get identifier => _identifier;
}