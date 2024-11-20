import 'package:aziko/src/module/widgets/animation_widgets/presentation/widgets/animation_widgets.dart';

class Location {
  final String? name;
  final String? urlImage;
  final String? latitude;
  final String? longitude;
  final String? addressLine1;
  final String? addressLine2;
  final int? starRating;
  final List<Review>? reviews;

  Location({
    this.reviews,
    this.name,
    this.urlImage,
    this.latitude,
    this.longitude,
    this.addressLine1,
    this.addressLine2,
    this.starRating,
  });
}
