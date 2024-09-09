import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import '../core/data/local/sharedpreferences/local_storage.dart';

import '../core/data/remote/firebase/firebase_auth.dart';
import '../core/data/remote/firebase/firestore.dart';

//import 'package:http/http.dart' as http;

import 'theme/bloc/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => ThemeBloc());

  //Usecases

  //Repositories

  //datasource

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
