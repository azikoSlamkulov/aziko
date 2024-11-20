import 'dart:developer';

import 'package:aziko/src/core/domain/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/presentation/widgets/widgets.dart';
import '../../../test.dart';
import 'add_car_color_page.dart';
import '../../../../home/presentation/pages/pages.dart';

class UpdateCarPage extends StatefulWidget {
  const UpdateCarPage({
    required this.car,
    Key? key,
  }) : super(key: key);

  final CarEntity car;

  @override
  State<UpdateCarPage> createState() => _UpdateCarPageState();
}

class _UpdateCarPageState extends State<UpdateCarPage> {
  @override
  void initState() {
    carColorsList = widget.car.carColors!;
    carNameController.text = widget.car.carName!;
    super.initState();
  }

  TextEditingController carNameController = TextEditingController();
  List<CarColorEntity> carColorsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update car'),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Center(
          // child: Text('Home Page'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: carNameController,
                decoration: InputDecoration(
                  label: const Text('Name'),
                  suffixIcon: IconButton(
                    onPressed: carNameController.clear,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле не должно быть пустым!';
                  }
                  return null;
                },
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
                    'Add new car color',
                    //style: AppTextStyles.black16Bold,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
              30.verticalSpace,
              const Text('Car colors list'),
              10.verticalSpace,
              carColorsList.isNotEmpty
                  ? ListView.builder(
                      itemCount: carColorsList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final carColor = carColorsList[index];
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: BlocProvider.of<CrudBloc>(context),
                                    child: UpdateCarColorPage(
                                        carColor: carColor,
                                        carColorUpdateCallback: (value) {
                                          //carColorsList.remove(carColor);
                                          //carColorsList.add(value);
                                          setState(() {});
                                        }),
                                  ),
                                ),
                              );
                            },
                            title: Text(
                              carColor.carColorInfo!.carColor!,
                              //style: AppTextStyles.black16Bold,
                            ),
                            trailing: const Icon(Icons.chevron_right),
                          ),
                        );
                      },
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
          //style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: () {
            // BlocProvider.of<CrudBloc>(context).add(
            //   AddObjectEvent(CarEntity(
            //     carName: carNameController.text,
            //     carColors: carColorsList,
            //   )),
            // );
            // Navigator.pop(context);
          },
          child: const Text('UPDATE'),
        ),
      ),
    );
  }
}
