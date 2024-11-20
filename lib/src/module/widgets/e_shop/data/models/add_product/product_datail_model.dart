import 'dart:convert';

import '../../../domain/entities/entities.dart';
import '../models.dart';

ProductDatailModel productDatailFromJson(Map docMap) =>
    ProductDatailModel.fromJson(docMap as Map<String, dynamic>);

String productDatailToJson(ProductDatailModel data) =>
    json.encode(data.toJson());

ProductDatailModel productDatailToModel(
        String id, ProductDatailEntity entity) =>
    ProductDatailModel(
      id: id,
      category: entity.category,
      brand: entity.brand,
      colorAndSizes: entity.colorAndSizes,
      // color: entity.color,
      // sizes: entity.sizes,
      isNew: entity.isNew,
      isSale: entity.isSale,
      sale: entity.sale,
      price: entity.price,
      newPrice: entity.newPrice,
      description: entity.description,
      rating: entity.rating,
      totalRating: entity.totalRating,
      totalUser: entity.totalUser,
      reviews: entity.reviews,
      mainImgUrl: entity.mainImgUrl,
      imgUrlList: entity.imgUrlList,
      createdDate: entity.createdDate,
    );

class ProductDatailModel extends ProductDatailEntity {
  const ProductDatailModel({
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
  }) : super(
          id: id,
          category: category,
          brand: brand,
          colorAndSizes: colorAndSizes,
          // color: color,
          // sizes: sizes,
          isNew: isNew,
          isSale: isSale,
          sale: sale,
          price: price,
          newPrice: newPrice,
          description: description,
          rating: rating,
          totalRating: totalRating,
          totalUser: totalUser,
          reviews: reviews,
          mainImgUrl: mainImgUrl,
          imgUrlList: imgUrlList,
          createdDate: createdDate,
        );

  factory ProductDatailModel.fromJson(Map<String, dynamic> json) =>
      ProductDatailModel(
        id: json['id'] as String,
        category: json['category'] != null
            ? CategoryModel.fromJson(json['category'])
            : const CategoryModel(),
        brand: json['brand'] as String,
        colorAndSizes: (json['colorAndSizes'] as List<dynamic>)
            .map((e) => ProductColorModel.fromJson(e))
            .toList(),
        // color: json['color'] as String,
        // sizes: (json['sizes'] as List<dynamic>)
        //     .map((e) => ProductSizeModel.fromJson(e))
        //     .toList(),
        isNew: json['isNew'] as bool,
        isSale: json['isSale'] as bool,
        sale: json['sale'] as int,
        price: json['price'] as double,
        newPrice: json['newPrice'] as double,
        description: json['description'] as String,
        rating: json['rating'] != null
            ? ProductRatingModel.fromJson(json['rating'])
            : const ProductRatingModel(),
        totalRating: json['totalRating'] as double,
        totalUser: json['totalUser'] as int,
        reviews: (json['reviews'] as List<dynamic>)
            .map((e) => ProductReviewModel.fromJson(e))
            .toList(),
        mainImgUrl: json['mainImgUrl'] as String,
        imgUrlList: (json['imgUrlList'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        createdDate: json['createdDate'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "category": CategoryModel(
          id: '',
          typeName: category!.typeName,
          collectionName: category!.collectionName,
          categoryName: category!.categoryName,
        ).toJson(),
        "brand": brand ?? '',
        "colorAndSizes": colorAndSizes!
            .map((item) => ProductColorModel(
                  colorName: item.colorName,
                  colorSizes: ProductSizeModel(
                    xs: item.colorSizes!.xs,
                    s: item.colorSizes!.s,
                    l: item.colorSizes!.l,
                    m: item.colorSizes!.m,
                    xl: item.colorSizes!.xl,
                  ),
                  colorImages: item.colorImages,
                ).toJson())
            .toList(),
        // "color": color ?? '',
        // "sizes": sizes!
        //     .map((item) => ProductSizeModel(
        //           quantity: item.quantity,
        //           size: item.size,
        //         ).toJson())
        //     .toList(),
        "isNew": isNew ?? true,
        "isSale": isSale ?? false,
        "sale": sale ?? 0,
        "price": price ?? 0.0,
        "newPrice": newPrice ?? 0.0,
        "description": description ?? '',
        "rating": rating ??
            const ProductRatingModel(
              totalRating: 0,
              totalUser: 0,
              one: 0,
              two: 0,
              three: 0,
              four: 0,
              five: 0,
            ).toJson(),
        "totalRating": totalRating ?? 0.0,
        "totalUser": totalUser ?? 0,
        "reviews": reviews!
            .map((item) => ProductReviewModel(
                  reviewId: item.reviewId,
                  productId: item.productId,
                  userId: item.userId,
                  userName: item.userName,
                  rate: item.rate,
                  reviewText: item.reviewText,
                  userPhotoUrl: item.userPhotoUrl,
                  imgUrlList: item.imgUrlList,
                  createdDate: createdDate,
                ).toJson())
            .toList(),
        "mainImgUrl": mainImgUrl ?? '',
        "imgUrlList": imgUrlList ?? [],
        "createdDate": createdDate ?? DateTime.now().toString(),
      };
}
