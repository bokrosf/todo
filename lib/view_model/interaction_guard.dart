mixin InteractionGuard {
  bool _locked = false;
  bool get locked => _locked;

  bool lock() {
    if (_locked) {
      return false;
    }

    _locked = true;

    return _locked;
  }

  void unlock() {
    _locked = false;
  }
}
