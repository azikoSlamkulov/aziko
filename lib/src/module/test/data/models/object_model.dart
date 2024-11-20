import 'dart:convert';

import 'package:aziko/src/module/test/domain/entities/object_entity.dart';

CarModel carFromJson(Map docMap) =>
    CarModel.fromJson(docMap as Map<String, dynamic>);

String carToJson(CarModel data) => json.encode(data.toJson());

CarModel carToModel(String id, CarEntity entity) => CarModel(
      id: id,
      carName: entity.carName,
      carColors: entity.carColors,
    );

class CarModel extends CarEntity {
  const CarModel({
    id,
    carName,
    carColors,
  }) : super(
          id: id,
          carName: carName,
          carColors: carColors,
        );

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        id: json['id'] as String,
        carName: json['carName'] as String,
        carColors: (json['carColors'] as List<dynamic>)
            .map((e) => CarColorModel.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "carName": carName ?? '',
        "carColors": carColors!
            .map((e) => CarColorModel(
                  carColorInfo: CarColorInfoModel(
                    carColor: e.carColorInfo!.carColor,
                    carQuantity: e.carColorInfo!.carQuantity,
                  ),
                  carImgs: e.carImgs,
                ).toJson())
            .toList(),
      };
}

// One
class CarColorModel extends CarColorEntity {
  const CarColorModel({
    carColorInfo,
    carImgs,
  }) : super(
          carColorInfo: carColorInfo,
          carImgs: carImgs,
        );

  factory CarColorModel.fromJson(Map<String, dynamic> json) => CarColorModel(
        carColorInfo: json['carColorInfo'] != null
            ? CarColorInfoModel.fromJson(json['carColorInfo'])
            : const CarColorInfoModel(),
        carImgs:
            (json['carImgs'] as List<dynamic>).map((e) => e as String).toList(),
      );

  Map<String, dynamic> toJson() => {
        "carColorInfo": CarColorInfoModel(
          carColor: carColorInfo!.carColor,
          carQuantity: carColorInfo!.carQuantity,
        ).toJson(),
        "carImgs": carImgs ?? [],
      };
}

// Two
class CarColorInfoModel extends CarColorInfoEntity {
  const CarColorInfoModel({
    carColor,
    carQuantity,
  }) : super(
          carColor: carColor,
          carQuantity: carQuantity,
        );

  factory CarColorInfoModel.fromJson(Map<String, dynamic> json) =>
      CarColorInfoModel(
        carColor: json['carColor'] as String,
        carQuantity: json['carQuantity'] as String,
      );

  Map<String, dynamic> toJson() => {
        "carColor": carColor ?? '',
        "carQuantity": carQuantity ?? '',
      };
}
