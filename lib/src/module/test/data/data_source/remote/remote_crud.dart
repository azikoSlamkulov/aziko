import '../../../../../core/core.dart';
import '../../models/models.dart';

abstract class RemoteCrud {
  Future<String> getId();
  Future<List<CarModel>> getAllObject();
  Future<CarModel> getObject({required String id});
  Future<bool> addObject({
    required CarModel object,
  });
  Future<bool> updateObject({
    required CarModel object,
  });
  Future<bool> deleteObject({
    required String id,
  });
}

class RemoteCrudImpl implements RemoteCrud {
  final FirestoreCore firestore;

  RemoteCrudImpl({required this.firestore});

  @override
  Future<String> getId() async {
    return await firestore.getId(
      collectionName: 'testCrud',
    );
  }

  @override
  Future<List<CarModel>> getAllObject() async {
    return await firestore.getList(
      collectionName: 'testCrud',
      fromJson: carFromJson,
    );
  }

  @override
  Future<CarModel> getObject({required String id}) async {
    return await firestore.get(
      docId: id,
      collectionName: 'testCrud',
      fromJson: carFromJson,
    );
  }

  @override
  Future<bool> addObject({
    required CarModel object,
  }) async {
    final isAdded = await firestore.set(
      docId: object.id!,
      objectModel: object,
      collectionName: 'testCrud',
    );
    return isAdded;
  }

  @override
  Future<bool> updateObject({required CarModel object}) async {
    final isUpdated = await firestore.set(
      docId: object.id!,
      objectModel: object,
      collectionName: 'testCrud',
    );
    return isUpdated;
  }

  @override
  Future<bool> deleteObject({required String id}) async {
    final isDeleted = await firestore.delete(
      docId: id,
      collectionName: 'testCrud',
    );
    return isDeleted;
  }
}
