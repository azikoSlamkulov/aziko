import 'dart:developer';

import 'package:aziko/src/core/domain/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/presentation/widgets/widgets.dart';
import '../../../test.dart';
import 'add_car_color_page.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({Key? key}) : super(key: key);

  // static String objectName = 'Crud';
  // static List<CarColorEntity>? objectOne = [
  //   CarColorEntity(
  //     carColorInfo: objectTwo,
  //     carImgs: listString,
  //   )
  // ];
  // static CarColorInfoEntity? objectTwo = const CarColorInfoEntity(
  //   crudProductColor: 'one',
  //   crudProductQuantity: 'two',
  // );
  // static List<String>? listString = ['sss', 'aaaa'];

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  TextEditingController carNameController = TextEditingController();
  List<CarColorEntity> carColorsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add car'),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Center(
          // child: Text('Home Page'),
          child: Column(
            children: [
              TextFormField(
                controller: carNameController,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле не должно быть пустым!';
                  }
                  return null;
                },
                // onChanged: (v) {},
              ),
              50.verticalSpace,
              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<CrudBloc>(context),
                          child: AddCarColorPage(
                            carColorCallback: (value) {
                              carColorsList.add(value);
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  title: const Text(
                    'Add car color',
                    //style: AppTextStyles.black16Bold,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
              10.verticalSpace,
              carColorsList.isNotEmpty
                  ? Card(
                      child: ExpansionTile(
                        title: const Text(
                          'Car colors list',
                          //style: AppTextStyles.black16Bold,
                          //style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        subtitle: Text(
                          carColorsList.isNotEmpty
                              ? '${carColorsList.length} colors'
                              : 'Empty',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        children: [
                          ListView.builder(
                            itemCount: carColorsList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final object = carColorsList[index];
                              return ListTile(
                                shape: const Border(
                                  top: BorderSide(color: Colors.black26),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider.value(
                                        value:
                                            BlocProvider.of<CrudBloc>(context),
                                        child: AddCarColorPage(
                                          //objects: widget.objects,
                                          carColorCallback: (value) =>
                                              carColorsList.add(value),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                title: Text(
                                  object.carColorInfo!.carColor!,
                                  //style: AppTextStyles.black16Bold,
                                ),
                                trailing: const Icon(Icons.chevron_right),
                              );
                            },
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        height: 88.h,
        child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: () {
            BlocProvider.of<CrudBloc>(context).add(
              AddObjectEvent(CarEntity(
                carName: carNameController.text,
                carColors: carColorsList,
              )),
            );
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ),
    );
  }
}
