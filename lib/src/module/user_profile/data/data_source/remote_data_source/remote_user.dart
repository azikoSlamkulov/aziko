import '../../../../../core/data/remote/firebase/firestore.dart';
import '../../models/user_model.dart';

abstract class RemoteUser {
  //Future<bool> checkUserExists({required String? userID});
  Future<UserModel> getUser({required String userID});
  Future<List<UserModel>> getAllUsers();
  Future<bool> updateUser({required user});
  Future<bool> deleteUser({required String userID});
  Future<UserModel> linkPhoneNumber({
    required String smsCode,
  });

  // Future<bool> updateDisplayName({
  //   required String name,
  //   required User currentUser,
  // });

  // Future<bool> updatePhotoURL({
  //   required String photoURL,
  //   required User currentUser,
  // });

  //Future<AuthUserModel> linkValidateOtp({required String smsCode});

  // Future<AuthUserModel> reauthenticateWithCredential({
  //   required AuthCredential credential,
  // });
}

class RemoteUserImpl implements RemoteUser {
  final FirestoreCore firestore;

  RemoteUserImpl({required this.firestore});

  @override
  Future<UserModel> getUser({required String userID}) async {
    return await firestore.get(
      id: userID,
      collectionName: 'users',
      fromJson: userFromJson,
    );
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    return await firestore.getList(
      collectionName: 'users',
      fromJson: userFromJson,
    );
  }

  @override
  Future<bool> updateUser({required user}) async {
    return await firestore.update(
      objectEntity: user,
      objectModel: UserModel(),
      collectionName: 'users',
    );
  }

  @override
  Future<bool> deleteUser({required String userID}) async {
    return await firestore.delete(
      userID: userID,
      collectionName: 'users',
    );
  }

  @override
  Future<UserModel> linkPhoneNumber({required String smsCode}) {
    // TODO: implement linkPhoneNumber
    throw UnimplementedError();
  }

  // @override
  // Future<bool> createNewUser({required user}) async {
  //   return await firestore.create(
  //     //objectEntity: user,
  //     objectModel: UserModel(),
  //     collectionName: 'users',
  //   );
  // }
}

  // final FirebaseFirestore firestoreDB;
  // FirestoreImpl({required this.firestoreDB});

  // @override
  // Future<UserModel> getUser({required String userID}) async {
  //   DocumentSnapshot _user =
  //       await firestoreDB.collection("user").doc(userID).get();
  //   if (_user.exists) {
  //     final _userMap = _user.data() as Map<String, dynamic>;
  //     UserModel _userObject = UserModel.fromJson(_userMap);
  //     return _userObject;
  //   } else {
  //     return UserModel();
  //   }
  // }

   // @override
  // Future<bool> updateDisplayName({
  //   required String name,
  //   required User currentUser,
  // }) async {
  //   return await firebaseAuthCore.updateDisplayName(
  //     name: name,
  //     currentUser: currentUser,
  //   );
  // }

  // @override
  // Future<bool> updatePhotoURL({
  //   required String photoURL,
  //   required User currentUser,
  // }) async {
  //   return await firebaseAuthCore.updatePhotoURL(
  //     photoURL: photoURL,
  //     currentUser: currentUser,
  //   );
  // }

// @override
  // Future<AuthUserModel> linkValidateOtp({
  //   String? smsCode,
  // }) async {
  //   final userCredential =
  //       await firebaseAuthCore.linkPhoneNumberValidateOtp(smsCode: smsCode!);
  //   final authCred = await firebaseAuthCore.reauthenticateWithCredential(
  //       credential: userCredential);
  //   final userCredentialModel = AuthUserModel(
  //     userID: authCred!.user!.uid,
  //     email: authCred.user!.email,
  //     name: authCred.user!.displayName,
  //     phoneNumber: authCred.user!.phoneNumber,
  //     photoURL: authCred.user!.photoURL,
  //   );
  //   return userCredentialModel;
  //   // final userModel = UserCredentialModel(
  //   //   userID: userCredential!.user!.uid,
  //   //   name: userCredential.user!.displayName,
  //   //   phoneNumber: userCredential.user!.phoneNumber,
  //   //   email: userCredential.user!.email,
  //   //   photoURL: userCredential.user!.photoURL,
  //   // );
  //   // return userModel;
  // }

  // @override
  // Future<AuthUserModel> reauthenticateWithCredential({
  //   required AuthCredential credential,
  // }) async {
  //   try {
  //     final userCredential = await firebaseAuthCore
  //         .reauthenticateWithCredential(credential: credential);
  //     final userCredentialModel = AuthUserModel(
  //       userID: userCredential!.user!.uid,
  //       email: userCredential.user!.email,
  //       name: userCredential.user!.displayName,
  //       phoneNumber: userCredential.user!.phoneNumber,
  //       photoURL: userCredential.user!.photoURL,
  //     );
  //     return userCredentialModel;
  //   } on FirebaseAuthException catch (e) {
  //     throw Exception(e);
  //   }
  // }
