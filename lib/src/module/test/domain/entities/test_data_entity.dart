import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TestDataEntity extends Equatable {
  final String testName;
  final Widget root;

  const TestDataEntity({
    required this.testName,
    required this.root,
  });

  @override
  List<Object> get props => [
        testName,
        root,
      ];
}
