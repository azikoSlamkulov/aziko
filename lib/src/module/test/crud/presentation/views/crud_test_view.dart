import 'dart:developer';

import 'package:aziko/src/config/util/app_widgets/buttons/custom_elevated_button.dart';
import 'package:aziko/src/config/util/app_widgets/inputs/custom_text_form_field.dart';
import 'package:aziko/src/module/test/crud/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/locator.dart';
import '../logic/crud_test/crud_test_bloc.dart';

// class CrudTestView extends StatelessWidget {
//   const CrudTestView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<CrudTestBloc>(
//       create: (context) => sl<CrudTestBloc>()..add(GetAllTestEvent()),
//       child: BlocBuilder<CrudTestBloc, CrudTestState>(
//         builder: (context, state) {
//           if (state is LoadingCrudTest) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is LoadedAllTestState) {
//             return NestedCrudTestView(
//               allObject: state.allTest,
//             );
//           } else if (state is CrudTestFailureState) {
//             return const Text('');
//           }
//           return const Text('');
//         },
//       ),
//     );
//   }
// }

class CrudTestView extends StatelessWidget {
  const CrudTestView({
    Key? key,
    //required this.allObject,
  }) : super(key: key);

  //final List<TestEntity>? allObject;

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameCont = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15, vertical: 45),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 200.verticalSpace,

              /// Name
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: nameCont,
                      //sizedBoxWidth: double.infinity,
                      labelText: 'Имя',
                    ),
                    30.horizontalSpace,

                    /// Button
                    SizedBox(
                      height: 50.h,
                      width: 70.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Ok',
                          //style: AppTextStyles.white18Bold,
                        ),
                        onPressed: () {
                          BlocProvider.of<CrudTestBloc>(context).add(
                            const CreatTestEvent(
                              object: TestEntity(
                                //id: '1',
                                object: [
                                  // ObjectEntity(id: '2', text: 'azat'),
                                  // ObjectEntity(id: '2', text: 'azat'),
                                ],
                              ),
                            ),
                          );
                          log(nameCont.text);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // 30.verticalSpace,
              // Expanded(
              //   child: ListView.builder(
              //     padding: REdgeInsets.all(14),
              //     itemCount: allObject!.length,
              //     //itemExtent: 155.h,
              //     itemBuilder: (context, index) {
              //       final test = allObject![index];
              //       // final objectList = [];
              //       // test.object!.map((e) => objectText = e.text!);

              //       // return Card(
              //       //   child: ExpansionTile(
              //       //     title: Text(
              //       //       test.id!,
              //       //     ),
              //       //     children: [
              //       //       ListView.builder(
              //       //         padding: REdgeInsets.all(14),
              //       //         itemCount: test.object!.length,
              //       //         itemExtent: 60.h,
              //       //         itemBuilder: (context, index) {
              //       //           final object = test.object![index];
              //       //           return Card(
              //       //             child: SizedBox(
              //       //               height: 60,
              //       //               child: ListTile(
              //       //                 title: Text(object.text!),
              //       //               ),
              //       //             ),
              //       //           );

              //       //           // return Card(
              //       //           //   child: SizedBox(
              //       //           //     height: 60,
              //       //           //     child: ListTile(
              //       //           //       title: Text(test.id!),
              //       //           //     ),
              //       //           //   ),
              //       //           // );
              //       //         },
              //       //       ),
              //       //       // ListTile(
              //       //       //   onTap: () {},
              //       //       //   title: Text(
              //       //       //     'All brands',

              //       //       //   ),
              //       //       // ),
              //       //     ],
              //       //   ),
              //       // );

              //       return Card(
              //         child: SizedBox(
              //           height: 60,
              //           child: ListTile(
              //             title: Text(test.id!),
              //             onTap: () {
              //               List<ObjectEntity> newObjectList = [];
              //               newObjectList
              //                   .add(ObjectEntity(id: '2', text: 'azat'));
              //               log('newObjectList ===>>>> $newObjectList');
              //               BlocProvider.of<CrudTestBloc>(context).add(
              //                 CreatTestEvent(
              //                   object: TestEntity(
              //                     id: test.id!,
              //                     object: newObjectList,
              //                   ),
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
