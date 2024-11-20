import 'dart:developer';

import 'package:aziko/src/core/domain/di/locator.dart';
import 'package:aziko/src/module/home/presentation/pages/pages.dart';
import 'package:aziko/src/module/test/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrudPage extends StatelessWidget {
  const CrudPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CrudBloc>(
          create: (context) => sl<CrudBloc>()
            ..add(
              GetAllObjectsEvent(),
            ),
        ),
      ],
      child: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          if (state is LoadingObjectState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedAllObjectsState) {
            return NestedHomePage(
              cars: state.allObject,
            );
          } else if (state is ObjectFailureState) {
            return const Text('');
          }
          return const Text('');
        },
      ),
    );
  }
}

class NestedHomePage extends StatelessWidget {
  const NestedHomePage({
    required this.cars,
    Key? key,
  }) : super(key: key);

  final List<CarEntity> cars;
  static CarEntity car = const CarEntity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        //titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Center(
          // child: Text('Home Page'),
          child: ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];
              return Card(
                child: ListTile(
                  // shape: const Border(
                  //   top: BorderSide(color: Colors.black26),
                  //   bottom: BorderSide(color: Colors.black26),
                  // ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<CrudBloc>(context),
                          child: UpdateCarPage(
                            car: car,
                          ),
                        ),
                      ),
                    );
                  },
                  title: Text(
                    car.carName!,
                    //style: AppTextStyles.black16Bold,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
              );
            },
          ),
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        height: 88.h,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<CrudBloc>(context),
                  child: const AddCarPage(),
                ),
              ),
            );
          },
          child: const Text('ADD NEW CAR'),
        ),
      ),
    );
  }
}
