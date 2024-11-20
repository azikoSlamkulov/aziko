import 'dart:developer';

import 'package:aziko/src/core/presentation/widgets/widgets.dart';
import 'package:aziko/src/module/test/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateCarColorPage extends StatefulWidget {
  const UpdateCarColorPage({
    required this.carColor,
    required this.carColorUpdateCallback,
    Key? key,
  }) : super(key: key);

  final CarColorEntity carColor;
  final ValueSetter<CarColorEntity>? carColorUpdateCallback;

  @override
  State<UpdateCarColorPage> createState() => _UpdateCarColorPageState();
}

class _UpdateCarColorPageState extends State<UpdateCarColorPage> {
  @override
  void initState() {
    carImgsList = widget.carColor.carImgs!;
    carColorController.text = widget.carColor.carColorInfo!.carColor!;
    carQuantityController.text = widget.carColor.carColorInfo!.carQuantity!;
    super.initState();
  }

  String string = '';
  List<String> carImgsList = [];
  TextEditingController carColorController = TextEditingController();
  TextEditingController carQuantityController = TextEditingController();
  TextEditingController imgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update car color'),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: carColorController,
                //..text = '${widget.carColor.carColorInfo!.carColor}',
                decoration: InputDecoration(
                  label: const Text('Color'),
                  suffixIcon: IconButton(
                    onPressed: carColorController.clear,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле не должно быть пустым!';
                  }
                  return null;
                },
                // onChanged: (v) {},
              ),
              20.verticalSpace,
              TextFormField(
                controller: carQuantityController,
                //..text = '${widget.carColor.carColorInfo!.carQuantity}',
                decoration: InputDecoration(
                  label: const Text('Quantity'),
                  suffixIcon: IconButton(
                    onPressed: carQuantityController.clear,
                    icon: const Icon(Icons.clear),
                  ),
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
                    AppBottomSheet.showBottomSheet(
                      context: context,
                      title: 'Add car images',
                      content: stringContent(context),
                    );
                  },
                  title: const Text(
                    'Add new car image',
                    //style: AppTextStyles.black16Bold,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
              30.verticalSpace,
              const Text('Car images list'),
              10.verticalSpace,
              carImgsList.isNotEmpty
                  ? ListView.builder(
                      itemCount: carImgsList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final car = carImgsList[index];
                        return Card(
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              car,
                              //style: AppTextStyles.black16Bold,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                carImgsList.remove(car);
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete),
                              //color: Colors.white,
                              //color: Theme.of(context).primaryColor,
                            ),
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
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: () {
            widget.carColorUpdateCallback!(
              CarColorEntity(
                carColorInfo: CarColorInfoEntity(
                  carColor: carColorController.text,
                  carQuantity: carQuantityController.text,
                ),
                carImgs: carImgsList,
              ),
            );
            // log('carColorController ====>>>> ${carColorController.text}');
            // log('carQuantityController ====>>>> ${carQuantityController.text}');
            // log('carImgsList ====>>>> ${carImgsList}');
            carColorController.clear();
            carQuantityController.clear();
            Navigator.pop(context);
          },
          child: const Text('UPDATE'),
        ),
      ),
    );
  }

  Widget stringContent(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: imgController,
          decoration: const InputDecoration(
            label: Text('Url'),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Поле не должно быть пустым!';
            }
            return null;
          },
          // onChanged: (v) {},
        ),
        30.verticalSpace,
        SizedBox(
          height: 50.h,
          width: 200.h,
          child: ElevatedButton(
            onPressed: () {
              //log('nameController ====>>>> ${nameController.text}');
              carImgsList.add(imgController.text);
              imgController.clear();
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text('Ok'),
          ),
        ),
        50.verticalSpace,
      ],
    );
  }
}
