import 'package:equatable/equatable.dart';
import '../../../domain/entities/user_entity.dart';

class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class LoadingState extends UserState {}

class LoadedState extends UserState {
  final UserEntity user;
  const LoadedState(this.user);
  @override
  List<Object> get props => [user];
}

class UserFailureState extends UserState {
  final String message;
  const UserFailureState(this.message);
  @override
  List<Object> get props => [message];
}
