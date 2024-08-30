import 'dart:convert';

import 'package:aziko/src/module/test/crud/domain/domain.dart';

ObjectModel objectFromJson(Map docMap) =>
    ObjectModel.fromJson(docMap as Map<String, dynamic>);

String objectToJson(ObjectModel data) => json.encode(data.toJson());

class ObjectModel extends ObjectEntity {
  const ObjectModel({
    final id,
    final text,
  }) : super(
          id: id,
          text: text,
        );

  factory ObjectModel.fromJson(Map<String, dynamic> json) => ObjectModel(
        id: json['id'] as String,
        text: (json['text'] as String),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "text": text ?? '',
      };
}
