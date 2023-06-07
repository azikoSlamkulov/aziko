import '../../domain/entities/user_entity.dart';

class FakeUserModel extends FakeUserEntity {
  const FakeUserModel({
    final int? id,
    final String? name,
  }) : super(
          id: id,
          name: name,
        );

  factory FakeUserModel.fromJson(Map<String, dynamic> json) => FakeUserModel(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  factory FakeUserModel.fromCacheJson(Map<String, dynamic> json) =>
      FakeUserModel(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "name": name ?? '',
      };

  Map<String, dynamic> toCacheJson() => {
        "id": id ?? '',
        "name": name ?? '',
      };
}
