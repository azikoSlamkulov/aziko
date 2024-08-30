import 'package:equatable/equatable.dart';

class TestEvent extends Equatable {
  const TestEvent();
  @override
  List<Object> get props => [];
}

class OpenTest1Event extends TestEvent {}

class OpenTest2Event extends TestEvent {}

class OpenTest3Event extends TestEvent {}

class CancelEvent extends TestEvent {}

class SumEvent extends TestEvent {
  final String oneThousand;
  final String fiveHundred;
  final String twoHundred;
  final String oneHundred;
  final String fifty;
  final String twenty;

  const SumEvent({
    required this.oneThousand,
    required this.fiveHundred,
    required this.twoHundred,
    required this.oneHundred,
    required this.fifty,
    required this.twenty,
  });

  @override
  List<Object> get props => [
        oneThousand,
        fiveHundred,
        twoHundred,
        oneHundred,
        fifty,
        twenty,
      ];
}
