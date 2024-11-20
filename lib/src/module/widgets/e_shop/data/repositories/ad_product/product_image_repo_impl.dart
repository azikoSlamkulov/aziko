import 'dart:developer';

import 'package:aziko/src/core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/domain.dart';
import '../../data_source/remote/remote.dart';

class ProductImageRepoImpl implements ProductImageRepo {
  ProductImageRepoImpl({
    required this.remoteProductImage,
  });

  final RemoteProductImage remoteProductImage;

  // @override
  // Future<Either<Failure, List<String>>> getAllImages() async {
  //   try {
  //     final allBrands = await remoteBrand.getAllBrands();
  //     return Right(allBrands);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  @override
  Future<Either<Failure, List<ProductSmallImageEntity>>>
      getAllProductSmallImages() async {
    try {
      final allBrands = await remoteProductImage.getAllProductSmallImages();
      return Right(allBrands);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAllProductBigImages({
    required String folderName,
  }) async {
    try {
      final allBrands = await remoteProductImage.getAllProductBigImages(
          folderName: folderName);
      return Right(allBrands);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> setProductImage({
    required String filePath,
    required String fileName,
  }) async {
    try {
      final productImageUrl = await remoteProductImage.setProductImage(
        filePath: filePath,
        fileName: fileName,
      );
      return Right(productImageUrl);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
