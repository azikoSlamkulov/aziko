import 'dart:developer';

import 'package:aziko/src/core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/domain.dart';
import '../../data_source/remote/remote.dart';
import '../../models/models.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({
    required this.remoteProduct,
  });

  final RemoteProducts remoteProduct;

  @override
  Future<Either<Failure, bool>> setProduct({
    required ProductDatailEntity productDatail,
  }) async {
    try {
      final productID = await remoteProduct.getProductID();

      final product = ProductModel(
        id: productID,
        category: productDatail.category,
        brand: productDatail.brand,
        isNew: productDatail.isNew,
        isSale: productDatail.isSale,
        sale: productDatail.sale,
        price: productDatail.price,
        newPrice: productDatail.newPrice,
        totalRating: productDatail.totalRating,
        totalUser: productDatail.totalUser,
        mainImgUrl: productDatail.mainImgUrl,
        createdDate: productDatail.createdDate,
      );

      final isCreated = await remoteProduct.setProduct(
        product: productToModel(productID, product),
        productDatail: productDatailToModel(productID, productDatail),
      );
      return Right(isCreated);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final allProducts = await remoteProduct.getAllProducts();
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDatailEntity>> getProductDatails(
      {required String productId}) async {
    try {
      log('productId ===>>>> $productId');
      final productDatails =
          await remoteProduct.getProductDatails(productId: productId);
      return Right(productDatails);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
