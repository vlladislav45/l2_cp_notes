class CharacterState {
  //Must have empty values!!!
  List<String> _classNames = [];
  bool _isLoading = false;

  CharacterState({classNames, bool isLoading})
      : _classNames = classNames,
        _isLoading = isLoading;

  bool get isLoading => _isLoading;

  List<String> get getClassNames => _classNames;


}
