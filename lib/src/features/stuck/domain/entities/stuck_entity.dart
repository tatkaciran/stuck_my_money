import 'package:equatable/equatable.dart';

class StuckEntity extends Equatable {
  final String id;
  final String ownerId;
  final String? imagePath;
  final String title;
  final String? description;
  final DateTime createdAt;
  final double moneyAmount;
  final double currentMoneyAmount;
  final double? mountlyFixedAmount;
  final DateTime? dueDate;
  final double urgency;

  const StuckEntity({
    required this.id,
    required this.ownerId,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.moneyAmount,
    required this.currentMoneyAmount,
    required this.mountlyFixedAmount,
    required this.dueDate,
    required this.urgency,
  });

  @override
  List<Object?> get props => [
        id,
        ownerId,
        imagePath,
        title,
        description,
        createdAt,
        moneyAmount,
        currentMoneyAmount,
        mountlyFixedAmount,
        dueDate,
        urgency,
      ];
}
