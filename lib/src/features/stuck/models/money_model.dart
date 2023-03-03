import 'package:equatable/equatable.dart';

enum MoneyType { user, stuck }

class Money extends Equatable {
  final String id;
  final MoneyType type;
  final String? userId;
  final String? stuckId;
  final String? title;
  final String? description;
  final double amount;
  final DateTime? createdAt;

  const Money({
    required this.id,
    required this.type,
    this.userId,
    this.stuckId,
    this.title,
    this.description,
    required this.amount,
    this.createdAt,
  });

  Money copyWith(
    String? id,
    MoneyType? type,
    String? userId,
    String? stuckId,
    String? title,
    String? description,
    double? amount,
    DateTime? createdAt,
  ) =>
      Money(
        id: id ?? this.id,
        type: type ?? this.type,
        userId: userId ?? this.userId,
        stuckId: stuckId ?? this.stuckId,
        title: title ?? this.title,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  String toString() => """

        id: $id,
        type: $type,
        userId: $userId,
        stuckId: $stuckId,
        title: $title,
        description: $description,
        amount: $amount,
        createdAt: $createdAt""";

  @override
  List<Object?> get props => [
        id,
        type,
        userId,
        stuckId,
        title,
        description,
        amount,
        createdAt,
      ];
}
