import 'package:aziko/src/module/auth/data/data_source/remote/firebase_auth_data.dart';
import 'package:aziko/src/module/auth/data/data_source/remote/firebase_auth_with_firestore.dart';
//import 'package:aziko/src/module/auth/data/repositories/auth_repo_impl_two.dart';
import 'package:aziko/src/module/auth/domain/usecases/get_current_user.dart';
import 'package:aziko/src/module/auth/domain/usecases/send_sms_code.dart';
import 'package:aziko/src/module/auth/domain/usecases/sign_in_with_phone_number.dart';
import 'package:aziko/src/module/user_profile/domain/repositories/user_repo.dart';
//import 'package:aziko/src/module/user_profile/domain/usecases/update_current_user.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../module/my_widgets/presentation/logic/multiple_toggle_btn_cubit/multiple_toogle_btn_cubit.dart';
import '../module/my_widgets/presentation/logic/single_toggle_btn/single_toggle_btn_cubit.dart';
import '../module/test/crud/test.dart';
import 'firebase_options.dart';
import '../core/data/local/sharedpreferences/local_storage.dart';

import '../core/data/remote/firebase/firebase_auth.dart';
import '../core/data/remote/firebase/firestore.dart';
import '../module/auth/data/data_source/local/local_auth_data.dart';
import '../module/auth/data/repositories/auth_repo_impl.dart';
import '../module/auth/domain/repositories/auth_repo.dart';
import '../module/test/http/data/repositories/user_repo_impl.dart';
import '../module/test/http/data/services/remote_services/user_remote_services.dart';
import '../module/test/http/domain/repositories/user_repo.dart';
import '../module/test/http/domain/usecases/get_all_users.dart';
import '../module/test/http/presentation/bloc/all_users_cubit/all_users_bloc.dart';
//import 'src/module/user_profile/domain/usecases/link_sms_code.dart';
import '../module/auth/domain/usecases/sign_in_with_email.dart';
import '../module/auth/domain/usecases/sign_in_with_google.dart';
import '../module/auth/domain/usecases/sign_out.dart';
import '../module/auth/domain/usecases/sign_up.dart';

import '../module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import '../module/user_profile/data/data_source/local_data_source/local_user.dart';
import '../module/user_profile/data/data_source/remote_data_source/remote_user.dart';
import '../module/user_profile/data/repositories/user_repo_impl.dart';

import '../module/user_profile/domain/usecases/get_user.dart';
import '../module/user_profile/presentation/logic/user_bloc/user_bloc.dart';

import 'package:http/http.dart' as http;

import 'theme/bloc/theme_bloc.dart';

//import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => ThemeBloc());

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

  sl.registerFactory(() => SingleToggleBtnCubit());
  sl.registerFactory(() => MultipleToogleBtnCubit());

  // sl.registerFactory(
  //   () => TimerCubit(
  //     getUser: sl(),
  //   ),
  // );

  // Bloc/Test/CRUD
  sl.registerFactory(
    () => CrudTestBloc(
      getAllTest: sl<GetAllTest>(),
      setTest: sl<CreatTest>(),
    ),
  );

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

  //Usecases/Test/CRUD
  sl.registerLazySingleton(() => GetAllTest(sl()));
  sl.registerLazySingleton(() => GetTest(sl()));
  sl.registerLazySingleton(() => CreatTest(sl()));
  sl.registerLazySingleton(() => UpdateTest(sl()));

  //Repositories
  //Repo/Test/CRUD
  sl.registerLazySingleton<TestRepo>(
    () => TestRepoImpl(remoteTest: sl()),
  );

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

  //Datasource/Test/CRUD
  sl.registerLazySingleton<RemoteTest>(
    () => RemoteTestImpl(firestore: sl()),
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
