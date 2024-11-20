import 'package:aziko/src/module/widgets/e_shop/data/data_source/remote/remote.dart';
import 'package:aziko/src/module/widgets/e_shop/data/repositories/repositories.dart';
import 'package:aziko/src/module/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../module/test/test.dart';
import '../../../config/firebase_options.dart';
import '../../data/local/sharedpreferences/local_storage.dart';

import '../../data/remote/firebase/firebase_auth.dart';
import '../../data/remote/firebase/firestore.dart';

//import 'package:http/http.dart' as http;

import '../../../config/theme/bloc/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc/Theme
  sl.registerFactory(() => ThemeBloc());

  //Bloc/CRUD
  sl.registerFactory(
    () => CrudBloc(
      getAllObjects: sl(),
      getObject: sl(),
      addObject: sl(),
      updateObject: sl(),
      deleteObject: sl(),
    ),
  );

  //Bloc/Add product
  sl.registerFactory(() => ProductBloc(
        setProducts: sl(),
        getAllProducts: sl(),
        getProductDatails: sl(),
      ));
  sl.registerFactory(() => BrandsBloc(
        getAllBrands: sl(),
        addBrand: sl(),
        daleteBrand: sl(),
      ));

  sl.registerFactory(() => CategoriesBloc(
        getCategories: sl(),
        getAllCategories: sl(),
        addCategory: sl(),
        daleteCategory: sl(),
      ));
  sl.registerFactory(() => BigImageCubit(
        getAllProductBigImages: sl(),
      ));
  sl.registerFactory(() => CategoryToggleBtnCubit());
  sl.registerFactory(() => SizesToggleBtnCubit());
  sl.registerFactory(() => ColorsToggleBtnCubit());
  sl.registerFactory(() => TypeToggleBtnCubit());
  sl.registerFactory(() => TabBarCubit());
  sl.registerFactory(() => ColorsAndSizesCubit());
  sl.registerFactory(() => PaymentMethodsCubit());

  //Usecases
  //Usecases/CRUD
  sl.registerLazySingleton(() => GetAllObjects(sl()));
  sl.registerLazySingleton(() => GetObject(sl()));
  sl.registerLazySingleton(() => AddObject(sl()));
  sl.registerLazySingleton(() => UpdateObject(sl()));
  sl.registerLazySingleton(() => DeleteObject(sl()));

  //Usecases/Add product
  sl.registerLazySingleton(() => GetAllBrands(sl()));
  sl.registerLazySingleton(() => AddBrand(sl()));
  sl.registerLazySingleton(() => DaleteBrand(sl()));
  sl.registerLazySingleton(() => GetAllCategories(sl()));
  sl.registerLazySingleton(() => GetCategories(sl()));
  sl.registerLazySingleton(() => AddCategory(sl()));
  sl.registerLazySingleton(() => DaleteCategory(sl()));
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProductDatails(sl()));
  sl.registerLazySingleton(() => SetProduct(sl()));
  sl.registerLazySingleton(() => GetAllProductBigImages(sl()));
  sl.registerLazySingleton(() => GetAllProductSmallImages(sl()));
  sl.registerLazySingleton(() => SetProductImage(sl()));

  //Repositories
  //Repositories/CRUD
  sl.registerLazySingleton<CrudRepo>(
    () => CrudRepoImpl(
      remoteCrud: sl(),
    ),
  );

  //Repositories/Add product
  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(
      remoteProduct: sl(),
    ),
  );
  sl.registerLazySingleton<BrandsRepo>(
    () => BrandsRepoImpl(
      remoteBrands: sl(),
    ),
  );
  sl.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepoImpl(
      remoteCategories: sl(),
    ),
  );
  sl.registerLazySingleton<ProductImageRepo>(
    () => ProductImageRepoImpl(
      remoteProductImage: sl(),
    ),
  );

  //datasource
  //datasource/CRUD
  sl.registerLazySingleton<RemoteCrud>(
    () => RemoteCrudImpl(
      firestore: sl(),
    ),
  );

  //datasource/Add product
  sl.registerLazySingleton<RemoteProducts>(
    () => RemoteProductsImpl(
      firestore: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteBrands>(
    () => RemoteBrandsImpl(
      firestore: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteCategories>(
    () => RemoteCategoriesImpl(
      firestore: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteProductImage>(
    () => RemoteProductImageImpl(
      fbStorageCore: sl(),
    ),
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
