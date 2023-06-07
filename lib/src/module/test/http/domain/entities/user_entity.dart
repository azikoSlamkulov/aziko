import 'package:equatable/equatable.dart';

class FakeUserEntity extends Equatable {
  final int? id;
  final String? name;

  const FakeUserEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
