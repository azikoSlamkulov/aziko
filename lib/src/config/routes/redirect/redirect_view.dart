import 'package:aziko/src/config/navbar/navbar.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:aziko/src/module/auth/presentation/logic/auth_bloc/auth_state.dart';
import 'package:aziko/src/module/auth/presentation/views/sign_in_otp_view.dart';
import 'package:aziko/src/module/auth/presentation/views/sign_in_vew.dart';
import 'package:aziko/src/module/auth/presentation/views/sign_up_view.dart';
import 'package:aziko/src/module/home/pages/home_page.dart';
import 'package:aziko/src/module/user_profile/presentation/views/link_otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../module/home/pages/admin_view.dart';
import '../../util/app_constants/colors/app_colors.dart';
import '../../util/app_widgets/progress/progress.dart';

const _scaffoldKey = ValueKey('_scaffoldKey');

class RedirectView extends StatelessWidget {
  const RedirectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpVerificationState) {
          // showTopSnackBar(
          //   context,
          //   const CustomSnackBar.info(
          //     message: "Код отправлен. Пожалуйста, проверьте свои сообщения.",
          //   ),
          //   animationDuration: const Duration(seconds: 3),
          //   reverseAnimationDuration: const Duration(seconds: 1),
          // );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        //bloc: _authBloc,
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return Scaffold(
              backgroundColor: AppColors.black,
              body: Center(
                child: progressIndicator.circularProgress(),
              ),
            );
          } else if (state is UnAuthenticatedState) {
            return SignInView();
          } else if (state is AuthenticatedState) {
            // return HomePage(
            //     //user: state.user,
            //     );
            return RootLayout(
              key: _scaffoldKey,
              currentIndex: 0,
              mobile: HomePage(),
              tablet: HomePage(),
            );
          } else if (state is AuthenticatedAdminState) {
            return const AdminView();
          } else if (state is OtpVerificationState) {
            return OtpView(phoneNumber: state.phoneNumber);
          } else if (state is LinkOtpVerificationState) {
            return LinkOtpView();
          } else if (state is SignUpState) {
            return SignUpView(
                //userCredential: (state).user,
                );
          }

          ///
          return const Scaffold(
            body: Center(
              child: Text('Что-то пошло не так. Попробуйте еще раз!'),
            ),
          );
        },
      ),
    );
  }
}
