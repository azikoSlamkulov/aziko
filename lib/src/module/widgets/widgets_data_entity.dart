import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WidgetsDataEntity extends Equatable {
  final String widgetName;
  final Widget root;

  const WidgetsDataEntity({
    required this.widgetName,
    required this.root,
  });

  @override
  List<Object> get props => [];
}
