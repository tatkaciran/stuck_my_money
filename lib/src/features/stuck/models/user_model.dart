import 'package:equatable/equatable.dart';
import 'package:stuck_my_money/src/features/stuck/models/money_model.dart';

class User extends Equatable {
  final String id;
  final DateTime? createdAt;
  final String? imagePath;
  final String? username;
  final Money? currentMoney;
  final int? timeToAct;

  const User({
    required this.id,
    required this.createdAt,
    this.imagePath,
    this.username,
    this.currentMoney,
    this.timeToAct,
  });

  static const User dummy = User(
    id: "0",
    createdAt: null,
    imagePath: null,
    username: "",
    currentMoney: Money(
      id: "0",
      type: MoneyType.user,
      amount: 300,
      userId: "0",
      title: "dummy users current money",
      description: "dummy users current money description",
    ),
    timeToAct: 0,
  );

  @override
  List<Object?> get props => [
        id,
        createdAt,
        imagePath,
        username,
        currentMoney,
        timeToAct,
      ];
}
