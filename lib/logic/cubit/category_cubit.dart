import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2_notes/logic/cubit/states/category_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterState());

  void update(List<String> classNames) =>
      emit(CharacterState(
          classNames: classNames,
          isLoading: false));
}
