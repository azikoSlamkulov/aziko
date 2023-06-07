part of 'password_cubit.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class InitialState extends PasswordState {}

class InvisibleState extends PasswordState {}

class VisibleState extends PasswordState {}
