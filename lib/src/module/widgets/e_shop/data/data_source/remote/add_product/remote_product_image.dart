import 'package:aziko/src/core/core.dart';

import '../../../models/models.dart';

abstract class RemoteProductImage {
  // Future<List<BrandModel>> getAllImages();
  Future<List<ProductSmallImageModel>> getAllProductSmallImages();
  Future<List<String>> getAllProductBigImages({required String folderName});
  Future<String> setProductImage({
    required String filePath,
    required String fileName,
  });
}

class RemoteProductImageImpl implements RemoteProductImage {
  final FirebaseStorageCore fbStorageCore;

  RemoteProductImageImpl({required this.fbStorageCore});

  // @override
  // Future<List<BrandModel>> getAllImages() async {
  //   return await firestore.getList(
  //     collectionName: 'brands',
  //     fromJson: brandFromJson,
  //   );
  // }

  @override
  Future<List<ProductSmallImageModel>> getAllProductSmallImages() async {
    // final imgUrl = await fbStorageCore.getImagesUrl(
    //   collectionName: 'product_small_images',
    // );
    return await fbStorageCore.getSmallImages(
      collectionName: 'product_small_images',
    );
  }

  @override
  Future<List<String>> getAllProductBigImages({
    required String folderName,
  }) async {
    return await fbStorageCore.getImagesUrlByFolderName(
      collectionName: 'product_images',
      folderName: folderName,
    );
  }

  @override
  Future<String> setProductImage({
    required String filePath,
    required String fileName,
  }) async {
    return await fbStorageCore.uploadImages(
      collectionName: 'product_images',
      filePath: filePath,
      fileName: fileName,
    );
  }
}
