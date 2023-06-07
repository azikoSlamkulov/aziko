// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// import '../../src.dart';

// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit(this.tService) : super(AuthState(token: tService.read));

//   final TokenService tService;

//   Future<void> save(String token) async {
//     await tService.save(token);
//     emit(AuthState(token: token));
//   }

//   Future<void> clear() async {
//     await tService.clear();
//     emit(const AuthState());
//   }
// }
