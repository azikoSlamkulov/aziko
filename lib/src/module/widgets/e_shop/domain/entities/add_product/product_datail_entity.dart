import 'package:aziko/src/module/widgets/e_shop/domain/entities/add_product/add_product.dart';
import 'package:equatable/equatable.dart';

class ProductDatailEntity extends Equatable {
  final String? id;
  final CategoryEntity? category;
  final String? brand;
  final List<ProductColorEntity>? colorAndSizes;
  //final String? color;
  //final List<ProductSizeEntity>? sizes;
  final bool? isNew;
  final bool? isSale;
  final int? sale;
  final double? price;
  final double? newPrice;
  final String? description;
  final ProductRatingEntity? rating;
  final double? totalRating;
  final int? totalUser;
  final List<dynamic>? reviews;
  final String? mainImgUrl;
  final List<String>? imgUrlList;
  final String? createdDate;

  const ProductDatailEntity({
    this.id,
    this.category,
    this.brand,
    this.colorAndSizes,
    //this.color,
    //this.sizes,
    this.isNew,
    this.isSale,
    this.sale,
    this.price,
    this.newPrice,
    this.description,
    this.rating,
    this.totalRating,
    this.totalUser,
    this.reviews,
    this.mainImgUrl,
    this.imgUrlList,
    this.createdDate,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        brand,
        colorAndSizes,
        // color,
        // sizes,
        isNew,
        isSale,
        sale,
        price,
        newPrice,
        description,
        rating,
        totalRating,
        totalUser,
        reviews,
        mainImgUrl,
        imgUrlList,
        createdDate,
      ];
}
