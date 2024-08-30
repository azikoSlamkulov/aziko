import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class GetCurrentUserEvent extends AuthEvent {}

class CancelEvent extends AuthEvent {}

class SignInWithPhoneNumberEvent extends AuthEvent {
  final String phoneNumber;
  final BuildContext context;

  const SignInWithPhoneNumberEvent(this.phoneNumber, this.context);

  @override
  List<Object> get props => [phoneNumber, context];
}

class LinkWithPhoneNumberEvent extends AuthEvent {
  final String phoneNumber;
  final BuildContext context;

  const LinkWithPhoneNumberEvent(this.phoneNumber, this.context);

  @override
  List<Object> get props => [phoneNumber, context];
}

class SendSmsCodeEvent extends AuthEvent {
  final String smsCode;

  const SendSmsCodeEvent(this.smsCode);

  @override
  List<Object> get props => [smsCode];
}

class LinkSmsCodeEvent extends AuthEvent {
  final String smsCode;

  const LinkSmsCodeEvent(this.smsCode);

  @override
  List<Object> get props => [smsCode];
}

class SignInWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInWithEmailEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignInWithGoogleEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String mainPhoneNumber;
  final String photoURL;

  SignUpEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.mainPhoneNumber,
    required this.photoURL,
  });

  @override
  List<Object> get props => [
        email,
        password,
        name,
        mainPhoneNumber,
        photoURL,
      ];
}

//class OpenSignUpEvent extends AuthEvent {}

//class RegistWithPhoneEvent extends AuthEvent {}

//class OpenSignInWithPhoneEvent extends AuthEvent {}

//class OpenSignInWithEmailEvent extends AuthEvent {}
