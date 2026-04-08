import 'package:equatable/equatable.dart';

class SkillEntity extends Equatable {
  final String name;
  final double proficiency; // 0.0 to 1.0
  final String category; // e.g. 'Frontend', 'Backend', 'Mobile'

  const SkillEntity({
    required this.name,
    required this.proficiency,
    required this.category,
  });

  @override
  List<Object> get props => [name, proficiency, category];
}
