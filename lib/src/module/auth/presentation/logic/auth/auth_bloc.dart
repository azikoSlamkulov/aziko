import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCurrentUser getCurrentUser;
  final SignInWithEmail signInWithEmail;
  final SignInWithGoogle signInWithGoogle;
  final SendPasswordResetEmail sendPasswordResetEmail;
  final SignUp signUp;
  final SignOut signOut;

  AuthBloc({
    required this.getCurrentUser,
    required this.signInWithEmail,
    required this.signInWithGoogle,
    required this.sendPasswordResetEmail,
    required this.signUp,
    required this.signOut,
  }) : super(UnAuthenticatedState()) {
    on<GetCurrentUserEvent>(_getCurrentUser);
    on<SignInWithEmailEvent>(_signInWithEmail);
    on<SendPasswordResetEmailEvent>(_sendPassword);
    on<SignInWithGoogleEvent>(_signInWithGoogle);
    on<SignOutEvent>(_signOut);
    on<CancelEvent>(_cancel);
    on<SignUpEvent>(_signUp);
    on<OpenSignUpEvent>(_openSignUp);
    on<OpenSignInEvent>(_openSignIn);
    on<OpenPasswordRecoveryEvent>(_openPasswordRecovery);
  }

  void _cancel(CancelEvent event, Emitter<AuthState> emit) {
    emit(UnAuthenticatedState());
  }

  void _openSignUp(OpenSignUpEvent event, Emitter<AuthState> emit) {
    emit(OpenSignUpState());
  }

  void _openSignIn(OpenSignInEvent event, Emitter<AuthState> emit) {
    emit(OpenSignInState());
  }

  void _openPasswordRecovery(
      OpenPasswordRecoveryEvent event, Emitter<AuthState> emit) {
    emit(OpenPasswordRecoveryState());
  }

  void _getCurrentUser(
    GetCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(UnAuthenticatedState());
    // final currentUser = await getCurrentUser.getCurrentUser();
    // currentUser.fold(
    //   (error) =>
    //       emit(AuthFailureState(error as ServerFailure, 'getCurrentUser')),
    //   (user) {
    //     if (user != null) {
    //       emit(AuthenticatedState(user));
    //     } else {
    //       emit(UnAuthenticatedState());
    //     }
    //   },
    // );
  }

  void _signInWithEmail(
      SignInWithEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    emit(AuthenticatedState(UserEntity()));
    // final user = await signInWithEmail(
    //   SignInWithEmailParams(
    //     email: event.email,
    //     password: event.password,
    //   ),
    // );
    // user.fold(
    //   (error) => emit(AuthFailureState(error as ServerFailure, 'signIn')),
    //   (user) => emit(AuthenticatedState(user)),
    // );
  }

  void _sendPassword(
      SendPasswordResetEmailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final isSent = await sendPasswordResetEmail(
      SendPasswordResetEmailParams(
        email: event.email,
      ),
    );
    isSent.fold(
      (error) =>
          emit(AuthFailureState(error as ServerFailure, 'passwordRecovery')),
      (isSent) => emit(SentPasswordState(isSent)),
    );
  }

  void _signInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final user = await signInWithGoogle.signInWithGoogle();
    user.fold(
      (error) =>
          emit(AuthFailureState(error as ServerFailure, 'signInWithGoogle')),
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
      (error) async => emit(AuthFailureState(error as ServerFailure, 'signUp')),
      (user) async => emit(AuthenticatedState(user)),
    );
  }

  void _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final isSignedOut = await signOut.signOut();
    isSignedOut.fold(
      (error) => emit(AuthFailureState(error as ServerFailure, 'signOut')),
      (isSignedOut) {
        if (isSignedOut!) {
          emit(UnAuthenticatedState());
        }
      },
    );
  }
}
