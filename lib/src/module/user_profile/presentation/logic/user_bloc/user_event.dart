import 'package:equatable/equatable.dart';

class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {
  final String? userID;

  const GetUserEvent(this.userID);
}
