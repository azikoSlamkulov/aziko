import 'package:equatable/equatable.dart';

class CarEntity extends Equatable {
  final String? id;
  final String? carName;
  final List<CarColorEntity>? carColors;

  const CarEntity({
    this.id,
    this.carName,
    this.carColors,
  });

  @override
  List<Object?> get props => [id, carColors];
}

// One
class CarColorEntity extends Equatable {
  final CarColorInfoEntity? carColorInfo;
  final List<String>? carImgs;

  const CarColorEntity({this.carColorInfo, this.carImgs});

  @override
  List<Object?> get props => [carColorInfo, carImgs];
}

// Two
class CarColorInfoEntity extends Equatable {
  final String? carColor;
  final String? carQuantity;

  const CarColorInfoEntity({
    this.carColor,
    this.carQuantity,
  });
  @override
  List<Object?> get props => [carColor, carQuantity];
}
