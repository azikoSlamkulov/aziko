import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_user.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;

  UserBloc({
    required this.getUser,
  }) : super(LoadingState()) {
    on<GetUserEvent>(_getUser);
  }

  void _getUser(GetUserEvent event, Emitter<UserState> emit) async {
    final user = await getUser(GetUserParams(userID: event.userID!));
    user.fold(
      (error) => emit(const UserFailureState('')),
      (_user) => emit(LoadedState(_user)),
    );
  }
}
