import 'package:aziko/src/config/util/app_widgets/dialogs/dialog.dart';
import 'package:aziko/src/config/util/app_widgets/dialogs/dialogs.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/util/app_constants/assets/app_assets.dart';
import '../../../auth/domain/entities/auth_user_entity.dart';
import '../../../auth/presentation/logic/auth_bloc/auth_bloc.dart';
import '../../../auth/presentation/logic/auth_bloc/auth_state.dart';
import '../../../auth/presentation/views/auth_check_view.dart';

class MobileProfileViwe extends StatelessWidget {
  const MobileProfileViwe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return NestedMobileProfileViwe(
            user: state.user,
          );
        } else if (state is UnAuthenticatedState) {
          return AuthCheckView();
        }
        return const Center(
            child: Text(
          'Some Error',
          style: TextStyle(color: Colors.black),
        ));
      },
    );
  }
}

class NestedMobileProfileViwe extends StatelessWidget {
  NestedMobileProfileViwe({required this.user, Key? key}) : super(key: key);

  AuthUser user;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.bgColorMain,
      // appBar: CustomAppBar(
      //   title: '',
      //   showSearchBtn: true,
      //   showBackBtn: false,
      //   bgColor: AppColors.bgColorMain,
      // ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 30, left: 16, right: 16),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Profile',
                      //style: AppTextStyles.black34Bold,
                    ),
                    24.verticalSpace,
                    InkWell(
                      //onTap: () => profileBottomSheet(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          circleAvatar(
                            onTap: () {},
                            imageUrl: user.photoURL!,
                          ),
                          15.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                user.name!,
                                //style: AppTextStyles.black18Bold,
                              ),
                              Text(
                                user.email!,
                                //style: AppTextStyles.grey14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            listTileBtn(context, 'Exit', '', true, true, () async {
              // BlocProvider.of<AuthBloc>(context).add(
              //   SignOutEvent(),
              // );
              context.read<AuthBloc>().add(SignOutEvent());
            }),
            listTileBtn(context, 'Test', '', true, true, () {
              ShowDialog.getDialog(
                context: context,
                title: 'asdasd',
                onPressed: () {},
              );
            }),
          ],
        ),
      ),
    );
  }
}

// profileBottomSheet(BuildContext context) {
//   return showModalBottomSheet<void>(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(30.r),
//         topRight: Radius.circular(30.r),
//       ),
//     ),
//     builder: (BuildContext context) {
//       return Padding(
//         padding: REdgeInsets.symmetric(horizontal: 16),
//         child: SizedBox(
//           height: 250.h,
//           child: Column(
//             children: [
//               Center(
//                 child: Padding(
//                   padding: REdgeInsets.only(top: 36),
//                   child: Text(
//                     'Add new card',
//                     style: AppTextStyles.black18Bold,
//                   ),
//                 ),
//               ),
//               33.verticalSpace,
//               CustomElevatedButton(
//                 sizedBoxHeight: 48.h,
//                 sizedBoxWidth: double.infinity,
//                 borderRadius: 30,
//                 bgColor: AppColors.mainColor,
//                 onPressed: () {
//                   CustomProgressIndicator().showLoaderDialog(context);
//                 },
//                 text: Text(
//                   'SAVE ADDRESS',
//                   style: AppTextStyles.white14,
//                 ),
//               ),
//               20.verticalSpace,
//               CustomElevatedButton(
//                 sizedBoxHeight: 48.h,
//                 sizedBoxWidth: double.infinity,
//                 borderRadius: 30,
//                 bgColor: AppColors.mainColor,
//                 // onPressed: () => BlocProvider.of<AuthBloc>(context).add(
//                 //   SignOutEvent(),
//                 // ),
//                 onPressed: () => context.pop(context),
//                 text: Text(
//                   'EXIT',
//                   style: AppTextStyles.white14,
//                 ),
//               ),
//               25.verticalSpace,
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

circleAvatar({required final VoidCallback onTap, required String imageUrl}) {
  return Container(
    //margin: REdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      //color: AppColors.bgColorCircleProfile,
      shape: BoxShape.circle,
      border: imageUrl.isNotEmpty
          ? Border.all(style: BorderStyle.none)
          : Border.all(color: Colors.grey),
    ),
    child: Stack(
      children: [
        if (imageUrl.isNotEmpty)
          CircleAvatar(
            radius: 30.w,
            backgroundImage: NetworkImage(imageUrl),
          )
        else
          Padding(
            padding: REdgeInsets.all(35.0),
            // child: FaIcon(
            //   icon,
            //   size: 25.w,
            //   color: AppColors.black,
            // ),
            child: AppAssets.profileIcon(width: 25.w, height: 25.w),
          ),
      ],
    ),
  );
}

listTileBtn(
  BuildContext context,
  String title,
  String subtitle,
  bool isTop,
  bool isBottom,
  VoidCallback onTap,
) {
  return SizedBox(
    height: 85.h,
    child: ListTile(
      shape: Border(
        top: isTop
            ? const BorderSide(color: Colors.black12, width: 0.5)
            : BorderSide.none,
        bottom: isBottom
            ? const BorderSide(color: Colors.black12, width: 0.5)
            : BorderSide.none,
      ),
      onTap: onTap,
      title: Text(
        title,
        //style: AppTextStyles.black16,
      ),
      subtitle: Text(
        subtitle,
        //style: AppTextStyles.grey11,
      ),
      trailing: const Icon(Icons.chevron_right),
    ),
  );
}

adminButton(
  BuildContext context,
  String text,
  bool isTop,
  bool isBottom,
  VoidCallback onTap,
) {
  return ListTile(
    shape: Border(
      top: isTop
          ? const BorderSide(color: Colors.black12, width: 0.5)
          : BorderSide.none,
      bottom: isBottom
          ? const BorderSide(color: Colors.black12, width: 0.5)
          : BorderSide.none,
    ),
    onTap: onTap,
    title: Text(
      text,
      //style: AppTextStyles.black16,
    ),
    trailing: const Icon(Icons.chevron_right),
  );
}
