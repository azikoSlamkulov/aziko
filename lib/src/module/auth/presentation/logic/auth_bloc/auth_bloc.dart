import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/auth_user_entity.dart';
import '../../../domain/usecases/get_current_user.dart';
import '../../../../user_profile/domain/usecases/link_sms_code.dart';
import '../../../domain/usecases/send_sms_code.dart';
import '../../../domain/usecases/sign_in_with_email.dart';
import '../../../domain/usecases/sign_in_with_google.dart';
import '../../../domain/usecases/sign_in_with_phone_number.dart';
import '../../../domain/usecases/sign_out.dart';
import '../../../domain/usecases/sign_up.dart';
import '../../../../user_profile/domain/usecases/update_current_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCurrentUser getCurrentUser;
  //final UpdateCurrentUser updateCurrentUser;
  final SignInWithPhoneNumber signInWithPhoneNumber;
  final SendSmsCode sendSmsCode;
  //final LinkSmsCode linkSmsCode;
  final SignInWithEmail signInWithEmail;
  final SignInWithGoogle signInWithGoogle;
  final SignUp signUp;
  final SignOut signOut;

  AuthBloc({
    required this.getCurrentUser,
    //required this.updateCurrentUser,
    required this.signInWithPhoneNumber,
    required this.sendSmsCode,
    //required this.linkSmsCode,
    required this.signInWithEmail,
    required this.signInWithGoogle,
    required this.signUp,
    required this.signOut,
  }) : super(AuthLoadingState()) {
    on<GetCurrentUserEvent>(_getCurrentUser);
    on<SignInWithPhoneNumberEvent>(_signInWithPhoneNumber);
    //on<LinkWithPhoneNumberEvent>(_linkWithPhoneNumber);
    on<SendSmsCodeEvent>(_sendSmsCode);
    //on<LinkSmsCodeEvent>(_linkSmsCode);
    on<SignInWithEmailEvent>(_signInWithEmail);
    on<SignInWithGoogleEvent>(_signInWithGoogle);
    on<SignOutEvent>(_signOut);
    on<CancelEvent>(_cancel);
    on<SignUpEvent>(_signUp);
    // on<OpenSignInWithPhoneEvent>(_openSignInWithPhone);
    // on<OpenSignInWithEmailEvent>(_openSignInWithEmail);
  }

  void _cancel(CancelEvent event, Emitter<AuthState> emit) {
    emit(UnAuthenticatedState());
  }

  void _getCurrentUser(
    GetCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    final currentUser = await getCurrentUser.getCurrentUser();
    currentUser.fold(
      (error) => emit(const AuthenticationFailureState('')),
      (user) {
        if (user != null) {
          emit(AuthenticatedState(user));
        } else {
          emit(UnAuthenticatedState());
        }
      },
    );
  }

  void _signInWithPhoneNumber(
      SignInWithPhoneNumberEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final signIn = await signInWithPhoneNumber(
      SignInWithPhoneNumberParams(
        phoneNumber: event.phoneNumber,
        context: event.context,
      ),
    );
    signIn.fold(
      (error) => emit(const AuthenticationFailureState('')),
      (sendSmsCode) => emit(OtpVerificationState(event.phoneNumber)),
    );
    //emit(OtpVerificationState(event.phoneNumber));
  }

  // void _linkWithPhoneNumber(
  //     LinkWithPhoneNumberEvent event, Emitter<AuthState> emit) async {
  //   emit(LoadingState());
  //   final signIn = await signInWithPhoneNumber(
  //     SignInWithPhoneNumberParams(
  //       phoneNumber: event.phoneNumber,
  //       context: event.context,
  //     ),
  //   );
  //   signIn.fold(
  //     (error) => emit(const AuthenticationFailureState('')),
  //     (sendSmsCode) => emit(LinkOtpVerificationState(event.phoneNumber)),
  //   );
  //   //emit(OtpVerificationState(event.phoneNumber));
  // }

  void _sendSmsCode(SendSmsCodeEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final currentUser = await sendSmsCode(
      SmsCodeParams(smsCode: event.smsCode),
    );
    currentUser.fold(
      (error) => emit(const AuthenticationFailureState('')),
      (user) => emit(AuthenticatedState(user)),
    );
  }

  // void _linkSmsCode(LinkSmsCodeEvent event, Emitter<AuthState> emit) async {
  //   emit(LoadingState());
  //   final currentUser = await linkSmsCode(
  //     LinkSmsCodeParams(smsCode: event.smsCode),
  //   );
  //   currentUser.fold(
  //     (error) => emit(const AuthenticationFailureState('')),
  //     (user) => emit(UnAuthenticatedState()),
  //   );
  // }

  void _signInWithEmail(
      SignInWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final user = await signInWithEmail(
      SignInWithEmailParams(
        email: event.email,
        password: event.password,
      ),
    );
    user.fold(
      (error) => emit(const AuthenticationFailureState('')),
      (user) => emit(AuthenticatedState(user)),
    );
  }

  void _signInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final user = await signInWithGoogle.signInWithGoogle();
    user.fold(
      (error) => emit(const AuthenticationFailureState('')),
      (user) => emit(AuthenticatedState(user)),
    );
  }

  void _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final userCredential = await signUp(
      SignUpParams(
        email: event.email,
        password: event.password,
      ),
    );
    await userCredential.fold(
      (error) async => emit(const AuthenticationFailureState('')),
      (user) async => emit(AuthenticatedState(user)),
    );
  }

  void _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final isSignedOut = await signOut.signOut();
    isSignedOut.fold(
      (error) => emit(const AuthenticationFailureState('')),
      (isSignedOut) {
        if (isSignedOut!) {
          emit(UnAuthenticatedState());
        }
      },
    );
  }

  // void _signUp(OpenSignUpEvent event, Emitter<AuthState> emit) async {
  //   emit(OpenSignUpState());
  // }

  // void _openSignInWithPhone(
  //     OpenSignInWithPhoneEvent event, Emitter<AuthState> emit) async {
  //   emit(OpenSignInWithPhoneState());
  // }

  // void _openSignInWithEmail(
  //     OpenSignInWithEmailEvent event, Emitter<AuthState> emit) async {
  //   emit(OpenSignInWithEmailState());
  // }

  // void _unAuthenticated(
  //     UnAuthenticatedEvent event, Emitter<AuthState> emit) async {
  //   emit(UnAuthenticatedState());
  // }

  // void _signInWithGoogle(
  //     SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
  //   emit(LoadingState());
  //   final _user = await signInWithGoogle.signInWithGoogle();
  //   _user.fold(
  //     (error) => emit(AuthenticationFailureState('')),
  //     (_user) => emit(AuthenticatedState(_user)),
  //   );
  // }

  // void _checkUserExist(
  //     CheckUserExistEvent event, Emitter<AuthState> emit) async {
  //   final _userCredential = event.userCredential;
  //   final _isUserExists = await checkUserExist.checkUserExist(
  //     userID: _userCredential.user!.uid,
  //   );
  //   _isUserExists.fold(
  //     (error) => emit(AuthenticationFailureState('')),
  //     (_user) async {
  //       log('_isUserExists ===>>>> $_isUserExists');
  //       if (!_user!) {
  //         emit(SignUpState(_userCredential));
  //       } else {
  //         final _userEntity = await getUser.getUser(
  //           userID: _userCredential.user!.uid,
  //         );
  //         log('_userEntity ===>>>> $_userEntity');
  //         _userEntity.fold(
  //           (error) => emit(AuthenticationFailureState('')),
  //           (_userEntity) => emit(AuthenticatedState(_userEntity)),
  //         );
  //       }
  //     },
  //   );
  // }

  /// Stream
  // @override
  // Stream<AuthState> mapEventToState(AuthEvent event) async* {
  //   if (event is GetAuthenticatedUser) {
  //     yield* _getAuthenticatedUser();
  //   }
  // }

  // Stream<AuthState> _getAuthenticatedUser() async* {
  //   final _currentuser = await getCurrentUser.getCurrentUser();
  //   _currentuser.fold(
  //     (error) => AuthenticationFailureState(''),
  //     (_user) {
  //       if (_user == UserEntity()) {
  //         UnAuthenticatedState();
  //       } else {
  //         //setAuthState(user: _user);
  //         AuthenticatedState(_user);
  //       }
  //     },
  //   );
  // }
}
