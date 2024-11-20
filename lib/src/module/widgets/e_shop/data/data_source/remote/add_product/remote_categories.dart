import 'package:aziko/src/core/core.dart';

import '../../../models/models.dart';

abstract class RemoteCategories {
  Future<String> getCategoryID();
  Future<List<CategoryModel>> getCategories({
    required String typeName,
    required String collectionName,
  });
  Future<List<CategoryModel>> getAllCategories();
  Future<bool> addCategory({
    required String id,
    required String typeName,
    required String collectionName,
    required String categoryName,
  });
  Future<bool> deleteCategory({
    required String id,
  });
}

class RemoteCategoriesImpl implements RemoteCategories {
  final FirestoreCore firestore;

  RemoteCategoriesImpl({required this.firestore});

  @override
  Future<String> getCategoryID() async {
    return await firestore.getId(
      collectionName: 'categories',
    );
  }

  @override
  Future<List<CategoryModel>> getCategories({
    required String typeName,
    required String collectionName,
  }) async {
    return await firestore.getCategoriesList(
      typeName: typeName,
      collectionName: collectionName,
      fromJson: categoryFromJson,
    );
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    return await firestore.getList(
      collectionName: 'categories',
      fromJson: categoryFromJson,
    );
  }

  @override
  Future<bool> addCategory({
    required String id,
    required String typeName,
    required String collectionName,
    required String categoryName,
  }) async {
    final categoryModel = CategoryModel(
      id: id,
      typeName: typeName,
      collectionName: collectionName,
      categoryName: categoryName,
    );
    return await firestore.set(
      docId: id,
      objectModel: categoryModel,
      collectionName: 'categories',
    );
  }

  @override
  Future<bool> deleteCategory({
    required String id,
  }) async {
    return await firestore.delete(
      docId: id,
      collectionName: 'categories',
    );
  }
}
