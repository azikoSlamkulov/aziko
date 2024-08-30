import 'package:equatable/equatable.dart';

class ToggleBtnEntity extends Equatable {
  final String name;
  final bool isSelected;

  const ToggleBtnEntity({
    required this.name,
    required this.isSelected,
  });

  @override
  List<Object?> get props => [
        name,
        isSelected,
      ];
}
