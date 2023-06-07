import 'package:aziko/src/module/auth/data/data_source/remote/firebase_auth_data.dart';
import 'package:aziko/src/module/auth/data/data_source/remote/firebase_auth_with_firestore.dart';
import 'package:aziko/src/module/auth/data/repositories/auth_repo_impl_two.dart';
import 'package:aziko/src/module/auth/domain/usecases/get_current_user.dart';
import 'package:aziko/src/module/auth/domain/usecases/send_sms_code.dart';
import 'package:aziko/src/module/auth/domain/usecases/sign_in_with_phone_number.dart';
import 'package:aziko/src/module/user_profile/domain/repositories/user_repo.dart';
import 'package:aziko/src/module/user_profile/domain/usecases/update_current_user.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'src/core/data/local/sharedpreferences/local_storage.dart';

import 'src/core/data/remote/firebase/firebase_auth.dart';
import 'src/core/data/remote/firebase/firestore.dart';
import 'src/module/auth/data/data_source/local/local_auth_data.dart';
import 'src/module/auth/data/repositories/auth_repo_impl.dart';
import 'src/module/auth/domain/repositories/auth_repo.dart';
import 'src/module/test/http/data/repositories/user_repo_impl.dart';
import 'src/module/test/http/data/services/remote_services/user_remote_services.dart';
import 'src/module/test/http/domain/repositories/user_repo.dart';
import 'src/module/test/http/domain/usecases/get_all_users.dart';
import 'src/module/test/http/presentation/bloc/all_users_cubit/all_users_bloc.dart';
import 'src/module/user_profile/domain/usecases/link_sms_code.dart';
import 'src/module/auth/domain/usecases/sign_in_with_email.dart';
import 'src/module/auth/domain/usecases/sign_in_with_google.dart';
import 'src/module/auth/domain/usecases/sign_out.dart';
import 'src/module/auth/domain/usecases/sign_up.dart';

import 'src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'src/module/user_profile/data/data_source/local_data_source/local_user.dart';
import 'src/module/user_profile/data/data_source/remote_data_source/remote_user.dart';
import 'src/module/user_profile/data/repositories/user_repo_impl.dart';

import 'src/module/user_profile/domain/usecases/get_user.dart';
import 'src/module/user_profile/presentation/logic/user_bloc/user_bloc.dart';

import 'package:http/http.dart' as http;

//import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(
    () => AuthBloc(
      getCurrentUser: sl(),
      //updateCurrentUser: sl(),
      signInWithPhoneNumber: sl(),
      sendSmsCode: sl(),
      //linkSmsCode: sl(),
      signInWithEmail: sl(),
      signInWithGoogle: sl(),
      signUp: sl(),
      signOut: sl(),
    ),
  );

  sl.registerFactory(
    () => UserBloc(
      getUser: sl(),
    ),
  );

  sl.registerFactory(
    () => AllUsersCubit(
      getAllUsers: sl<GetAllUsers>(),
    ),
  );

  // sl.registerFactory(
  //   () => TimerCubit(
  //     getUser: sl(),
  //   ),
  // );

  //Usecases
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  //sl.registerLazySingleton(() => UpdateCurrentUser(sl()));
  sl.registerLazySingleton(() => SignInWithPhoneNumber(sl()));
  sl.registerLazySingleton(() => SendSmsCode(sl()));
  //sl.registerLazySingleton(() => LinkSmsCode(sl()));
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));

  sl.registerLazySingleton(() => GetAllUsers(sl()));

  //Repositories
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      remoteAuth: sl(),
      localAuth: sl(),
    ),
  );

  // sl.registerLazySingleton<AuthRepo>(
  //   () => AuthRepoImplTwo(
  //     remoteAuth: sl(),
  //     localAuth: sl(),
  //   ),
  // );

  sl.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(
      remoteUser: sl(),
      localUser: sl(),
    ),
  );

  sl.registerLazySingleton<FakeUserRepo>(
    () => FakeUserRepoImpl(
      userRemoteServices: sl(),
    ),
  );

  //datasource
  sl.registerLazySingleton<FirebaseAuthData>(
    () => FirebaseAuthDataImpl(
      firebaseAuth: sl(),
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<FirebaseAuthWithFirestore>(
    () => FirebaseAuthImpl(
      firebaseAuth: sl(),
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<LocalAuth>(
    () => AuthSharedPreferencesImpl(authPreferences: sl()),
  );

  sl.registerLazySingleton<RemoteUser>(
    () => RemoteUserImpl(firestore: sl()),
  );

  sl.registerLazySingleton<LocalUser>(
    () => SharedPreferencesImpl(preferences: sl()),
  );

  //Core
  sl.registerLazySingleton<FirebaseAuthCore>(
    () => FirebaseAuthCoreImpl(firebaseAuth: sl()),
  );
  sl.registerLazySingleton<FirestoreCore>(
    () => FirestoreCoreImpl(firestoreDB: sl()),
  );
  sl.registerLazySingleton<SharedPreferencesDB>(
    () => SharedPreferencesImp(preferencesCore: sl()),
  );

  sl.registerLazySingleton<UserRemoteServices>(
    () => UserRemoteServicesImpl(
      client: http.Client(),
    ),
  );

  //Extarnal
  final firebase = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  sl.registerLazySingleton(() => firebase);
  final firebaseAuthDB = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuthDB);
  final firestoreDB = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestoreDB);
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
