import 'package:aziko/src/module/test/crud/domain/domain.dart';
import 'package:equatable/equatable.dart';

class TestEntity extends Equatable {
  final String? id;
  final List<dynamic>? object;

  const TestEntity({
    this.id,
    this.object,
  });

  @override
  List<Object?> get props => [
        id,
        object,
      ];
}
