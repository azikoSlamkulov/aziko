import '../../../../../../core/data/remote/firebase/firestore.dart';
import '../../../test.dart';

abstract class RemoteTest {
  Future<String> getTestId();
  Future<List<TestModel>> getAllTest();
  Future<TestModel> getTest({required String id});
  Future<bool> setTest({required TestModel object});
  Future<bool> updateTest({required TestModel object});
}

class RemoteTestImpl extends RemoteTest {
  final FirestoreCore firestore;

  RemoteTestImpl({required this.firestore});

  @override
  Future<String> getTestId() async {
    return await firestore.getId(
      collectionName: 'test',
    );
  }

  @override
  Future<TestModel> getTest({required String id}) {
    // TODO: implement getTest
    throw UnimplementedError();
  }

  @override
  Future<bool> setTest({required TestModel object}) async {
    return await firestore.create(
      docId: object.id!,
      objectModel: object,
      collectionName: 'test',
    );
  }

  @override
  Future<bool> updateTest({required TestModel object}) async {
    return await firestore.update(
      docId: object.id!,
      objectModel: object,
      collectionName: 'test',
    );
  }

  @override
  Future<List<TestModel>> getAllTest() async {
    return await firestore.getList(
      collectionName: 'test',
      fromJson: testFromJson,
    );
  }
}
