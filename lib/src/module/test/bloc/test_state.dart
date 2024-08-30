import 'package:equatable/equatable.dart';

class TestState extends Equatable {
  const TestState();
  @override
  List<Object> get props => [];
}

class LoadingState extends TestState {}

class OpenedTest1State extends TestState {}

class OpenedTest2State extends TestState {}

class OpenedTest3State extends TestState {}

class SumState extends TestState {
  final int sum;

  const SumState({required this.sum});

  @override
  List<Object> get props => [sum];
}

class TestFailureState extends TestState {
  final String message;
  const TestFailureState(this.message);
  @override
  List<Object> get props => [message];
}
