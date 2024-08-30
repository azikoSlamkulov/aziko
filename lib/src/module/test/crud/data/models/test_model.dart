import 'dart:convert';

import 'package:aziko/src/module/test/crud/test.dart';

TestModel testFromJson(Map docMap) =>
    TestModel.fromJson(docMap as Map<String, dynamic>);

String testToJson(TestModel data) => json.encode(data.toJson());

objectMap(List<dynamic> object) {
  return object
      .map((item) => ObjectModel(
            id: item.id,
            text: item.text,
          ).toJson())
      .toList();
}

class TestModel extends TestEntity {
  const TestModel({
    final id,
    final object,
  }) : super(
          id: id,
          object: object,
        );

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        id: json['id'] as String,
        object: (json['object'] as List<dynamic>)
            .map((e) => ObjectModel.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        //"object": List<dynamic>.from(object!.map((x) => x.toJson())),
        //"object": [],
        "object": objectMap(object!),
      };
}
