import 'dart:developer';

import 'package:aziko/src/core/presentation/widgets/widgets.dart';
import 'package:aziko/src/module/test/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCarColorPage extends StatefulWidget {
  const AddCarColorPage({
    //required this.objects,
    required this.carColorCallback,
    Key? key,
  }) : super(key: key);

  //final List<ObjectEntity> objects;
  final ValueSetter<CarColorEntity>? carColorCallback;

  @override
  State<AddCarColorPage> createState() => _AddCarColorPageState();
}

class _AddCarColorPageState extends State<AddCarColorPage> {
  List<String> carImgsList = [];
  TextEditingController carColorController = TextEditingController();
  TextEditingController carQuantityController = TextEditingController();
  TextEditingController stringController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add car color'),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: carColorController,
                decoration: const InputDecoration(
                  label: Text('Color'),
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
                decoration: const InputDecoration(
                  label: Text('Quantity'),
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
                    'Add car images',
                    //style: AppTextStyles.black16Bold,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
              10.verticalSpace,
              carImgsList.isNotEmpty
                  ? Card(
                      child: ExpansionTile(
                        title: const Text(
                          'Images urls list',
                          //style: AppTextStyles.black16Bold,
                          //style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        subtitle: Text(
                          carImgsList.isNotEmpty
                              ? '${carImgsList.length} urls'
                              : 'Empty',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14.sp,
                          ),
                        ),
                        children: [
                          ListView.builder(
                            itemCount: carImgsList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final string = carImgsList[index];
                              return ListTile(
                                shape: const Border(
                                  top: BorderSide(color: Colors.black26),
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) => BlocProvider.value(
                                  //       value:
                                  //           BlocProvider.of<CrudBloc>(context),
                                  //       child: AddObjectPage(
                                  //         objects: objects,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // );
                                },
                                title: Text(
                                  string,
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
            widget.carColorCallback!(
              CarColorEntity(
                carColorInfo: CarColorInfoEntity(
                  carColor: carColorController.text,
                  carQuantity: carQuantityController.text,
                ),
                carImgs: carImgsList,
              ),
            );
            // log('oneController ====>>>> ${AddObjectPage.oneController.text}');
            // log('twoController ====>>>> ${AddObjectPage.twoController.text}');
            // log('stringList ====>>>> ${AddObjectPage.stringList}');
            carColorController.clear();
            carQuantityController.clear();
            Navigator.pop(context);
          },
          child: const Text('ADD'),
        ),
      ),
    );
  }

  Widget stringContent(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: stringController,
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
              carImgsList.add(stringController.text);
              stringController.clear();
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text('OK'),
          ),
        ),
        50.verticalSpace,
      ],
    );
  }
}
