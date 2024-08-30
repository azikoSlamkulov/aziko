import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WidgetListEntity extends Equatable {
  final String? name;
  final Widget? stateFul;
  final Widget? bloc;

  const WidgetListEntity({
    this.name,
    this.stateFul,
    this.bloc,
  });

  @override
  List<Object?> get props => [
        name,
        stateFul,
        bloc,
      ];
}
