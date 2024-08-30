import 'package:equatable/equatable.dart';

class ObjectEntity extends Equatable {
  final String? id;
  final String? text;

  const ObjectEntity({
    this.id,
    this.text,
  });

  @override
  List<Object?> get props => [
        id,
        text,
      ];
}
