import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'money_model.dart';

enum StuckUrgency {
  fixed,
  sleepy,
  satisfying,
  focused,
  ambitious;

  double get percent => () {
        switch (this) {
          case StuckUrgency.fixed:
            return 0.0;
          case StuckUrgency.sleepy:
            return 0.5;
          case StuckUrgency.satisfying:
            return 1.0;
          case StuckUrgency.focused:
            return 2.0;
          case StuckUrgency.ambitious:
            return 3.0;
        }
      }();

  String get label => () {
        switch (this) {
          case StuckUrgency.fixed:
            return " Fixed";
          case StuckUrgency.sleepy:
            return " Sleepy";
          case StuckUrgency.satisfying:
            return "Satisfying";
          case StuckUrgency.focused:
            return "Focused";
          case StuckUrgency.ambitious:
            return "Ambitious";
        }
      }();

  Color get color => () {
        switch (this) {
          case StuckUrgency.fixed:
            return Colors.teal;
          case StuckUrgency.sleepy:
            return Colors.yellow;
          case StuckUrgency.satisfying:
            return Colors.blue;
          case StuckUrgency.focused:
            return Colors.pink;
          case StuckUrgency.ambitious:
            return Colors.red;
        }
      }();

  IconData get icon => () {
        switch (this) {
          case StuckUrgency.fixed:
            return Icons.fullscreen_exit;
          case StuckUrgency.sleepy:
            return Icons.dark_mode;
          case StuckUrgency.satisfying:
            return Icons.icecream_rounded;
          case StuckUrgency.focused:
            return Icons.filter_tilt_shift_rounded;
          case StuckUrgency.ambitious:
            return Icons.local_fire_department;
        }
      }();
}

class Stuck extends Equatable {
  final String id;
  final String ownerId;
  final double? fixedPercentage;
  final String? imagePath;
  final String title;
  final String? description;
  final DateTime? createdAt;
  final Money moneyAmount;
  final Money? currentMoneyAmount;
  final Money? mountlyFixedAmount;
  final DateTime? dueDate;
  final StuckUrgency urgency;
  final bool? _isActive;

  const Stuck({
    required this.id,
    required this.ownerId,
    this.fixedPercentage,
    this.imagePath,
    required this.title,
    this.description,
    this.createdAt,
    required this.moneyAmount,
    this.currentMoneyAmount,
    this.mountlyFixedAmount,
    this.dueDate,
    required this.urgency,
    bool? isActive,
  }) : _isActive = isActive;

  Stuck copyWith({
    String? id,
    String? ownerId,
    double? fixedPercentage,
    String? imagePath,
    String? title,
    String? description,
    DateTime? createdAt,
    Money? moneyAmount,
    Money? currentMoneyAmount,
    Money? mountlyFixedAmount,
    DateTime? dueDate,
    StuckUrgency? urgency,
    bool? isActive,
  }) =>
      Stuck(
          id: id ?? this.id,
          ownerId: ownerId ?? this.ownerId,
          fixedPercentage: fixedPercentage ?? this.fixedPercentage,
          imagePath: imagePath ?? this.imagePath,
          title: title ?? this.title,
          description: description ?? this.description,
          createdAt: createdAt ?? this.createdAt,
          moneyAmount: moneyAmount ?? this.moneyAmount,
          currentMoneyAmount: currentMoneyAmount ?? this.currentMoneyAmount,
          mountlyFixedAmount: mountlyFixedAmount ?? this.mountlyFixedAmount,
          dueDate: dueDate ?? this.dueDate,
          urgency: urgency ?? this.urgency,
          isActive: isActive ?? _isActive);

  @override
  List<Object?> get props => [
        id,
        ownerId,
        fixedPercentage,
        imagePath,
        title,
        description,
        createdAt,
        moneyAmount,
        currentMoneyAmount,
        mountlyFixedAmount,
        dueDate,
        urgency,
        _isActive
      ];

  @override
  String toString() => """
-------------------------------------------------------------------------------
id: $id,
ownerId: $ownerId,
fixedPercentage: $fixedPercentage,
imagePath: $imagePath,
title: $title,
description: $description,
createdAt: $createdAt,
moneyAmount: $moneyAmount,
currentMoneyAmount: $currentMoneyAmount,
mountlyFixedAmount: $mountlyFixedAmount,
dueDate: $dueDate,
urgency: $urgency,
isActive: $_isActive
--------------------------------------------------------------------------------""";

  static const List<Stuck> dummyDatas = [
    Stuck(
      id: "0",
      ownerId: "0",
      title: "New fast charger",
      currentMoneyAmount: Money(
        id: "0",
        type: MoneyType.stuck,
        amount: 300,
        stuckId: "0",
        userId: "0",
      ),
      moneyAmount: Money(
        id: "0",
        type: MoneyType.stuck,
        amount: 300,
        stuckId: "0",
        userId: "0",
      ),
      urgency: StuckUrgency.satisfying,
    ),
    Stuck(
      id: "1",
      ownerId: "1",
      title: "King size dog house",
      currentMoneyAmount: Money(
        id: "1",
        type: MoneyType.stuck,
        amount: 600,
        stuckId: "1",
        userId: "1",
      ),
      moneyAmount: Money(
        id: "1",
        type: MoneyType.stuck,
        amount: 3000,
        stuckId: "1",
        userId: "1",
      ),
      urgency: StuckUrgency.sleepy,
    ),
    Stuck(
      id: "2",
      ownerId: "2",
      title: "Change bath switch to new one",
      currentMoneyAmount: Money(
        id: "2",
        type: MoneyType.stuck,
        amount: 180,
        stuckId: "2",
        userId: "2",
      ),
      moneyAmount: Money(
        id: "2",
        type: MoneyType.stuck,
        amount: 200,
        stuckId: "2",
        userId: "2",
      ),
      urgency: StuckUrgency.satisfying,
    ),
    Stuck(
      id: "3",
      ownerId: "3",
      title: "New SSD for PS5",
      currentMoneyAmount: Money(
        id: "3",
        type: MoneyType.stuck,
        amount: 750,
        stuckId: "3",
        userId: "3",
      ),
      moneyAmount: Money(
        id: "3",
        type: MoneyType.stuck,
        amount: 750,
        stuckId: "3",
        userId: "3",
      ),
      urgency: StuckUrgency.focused,
    ),
    Stuck(
      id: "4",
      ownerId: "4",
      fixedPercentage: 0.3,
      title: "Dummy Data 4",
      currentMoneyAmount: Money(
        id: "4",
        type: MoneyType.stuck,
        amount: 10,
        stuckId: "4",
        userId: "4",
      ),
      moneyAmount: Money(
        id: "4",
        type: MoneyType.stuck,
        amount: 550,
        stuckId: "4",
        userId: "4",
      ),
      urgency: StuckUrgency.focused,
    ),
    Stuck(
      id: "5",
      ownerId: "5",
      title: "Smart pen for tablet",
      currentMoneyAmount: Money(
        id: "5",
        type: MoneyType.stuck,
        amount: 50,
        stuckId: "5",
        userId: "5",
      ),
      moneyAmount: Money(
        id: "5",
        type: MoneyType.stuck,
        amount: 150,
        stuckId: "5",
        userId: "5",
      ),
      urgency: StuckUrgency.satisfying,
    ),
    Stuck(
      id: "6",
      ownerId: "6",
      title: "Nike Blazer Mid '77 Vintage",
      fixedPercentage: 0.1,
      currentMoneyAmount: Money(
        id: "6",
        type: MoneyType.stuck,
        amount: 100,
        stuckId: "6",
        userId: "6",
      ),
      moneyAmount: Money(
        id: "6",
        type: MoneyType.stuck,
        amount: 600,
        stuckId: "6",
        userId: "6",
      ),
      urgency: StuckUrgency.ambitious,
      isActive: false,
    ),
    Stuck(
      id: "7",
      ownerId: "7",
      title: "Get new electric bike",
      currentMoneyAmount: Money(
        id: "7",
        type: MoneyType.stuck,
        amount: 700,
        stuckId: "7",
        userId: "7",
      ),
      moneyAmount: Money(
        id: "7",
        type: MoneyType.stuck,
        amount: 1700,
        stuckId: "7",
        userId: "7",
      ),
      urgency: StuckUrgency.ambitious,
    ),
    Stuck(
      id: "8",
      ownerId: "8",
      title: "IKEA BEKANT table",
      currentMoneyAmount: Money(
        id: "8",
        type: MoneyType.stuck,
        amount: 900,
        stuckId: "8",
        userId: "8",
      ),
      moneyAmount: Money(
        id: "8",
        type: MoneyType.stuck,
        amount: 1200,
        stuckId: "8",
        userId: "8",
      ),
      urgency: StuckUrgency.satisfying,
      isActive: false,
    ),
    Stuck(
      id: "9",
      ownerId: "9",
      title: "Tuition Fee Payments",
      currentMoneyAmount: Money(
        id: "9",
        type: MoneyType.stuck,
        amount: 500,
        stuckId: "9",
        userId: "9",
      ),
      moneyAmount: Money(
        id: "9",
        type: MoneyType.stuck,
        amount: 6000,
        stuckId: "9",
        userId: "9",
      ),
      urgency: StuckUrgency.sleepy,
    ),
    Stuck(
      id: "10",
      ownerId: "10",
      title: "Resident Evil Remake",
      currentMoneyAmount: Money(
        id: "10",
        type: MoneyType.stuck,
        amount: 90,
        stuckId: "10",
        userId: "10",
      ),
      moneyAmount: Money(
        id: "10",
        type: MoneyType.stuck,
        amount: 100,
        stuckId: "10",
        userId: "10",
      ),
      urgency: StuckUrgency.satisfying,
    ),
    Stuck(
      id: "11",
      ownerId: "11",
      title: "Summer vacation",
      currentMoneyAmount: Money(
        id: "11",
        type: MoneyType.stuck,
        amount: 50,
        stuckId: "11",
        userId: "11",
      ),
      moneyAmount: Money(
        id: "11",
        type: MoneyType.stuck,
        amount: 2250,
        stuckId: "11",
        userId: "11",
      ),
      urgency: StuckUrgency.sleepy,
      isActive: false,
    ),
    Stuck(
      id: "12",
      ownerId: "12",
      title: "Prepare for the new iPhone",
      currentMoneyAmount: Money(
        id: "12",
        type: MoneyType.stuck,
        amount: 250,
        stuckId: "12",
        userId: "12",
      ),
      moneyAmount: Money(
        id: "12",
        type: MoneyType.stuck,
        amount: 1250,
        stuckId: "12",
        userId: "12",
      ),
      urgency: StuckUrgency.sleepy,
      isActive: false,
    ),
    Stuck(
      id: "13",
      ownerId: "13",
      title: "to pocket cars collection",
      currentMoneyAmount: Money(
        id: "13",
        type: MoneyType.stuck,
        amount: 300,
        stuckId: "13",
        userId: "13",
      ),
      mountlyFixedAmount: Money(
        id: "13",
        type: MoneyType.stuck,
        amount: 50,
        stuckId: "13",
        userId: "13",
      ),
      moneyAmount: Money(
        id: "13",
        type: MoneyType.stuck,
        amount: 900,
        stuckId: "13",
        userId: "13",
      ),
      urgency: StuckUrgency.satisfying,
    ),
    Stuck(
      id: "14",
      ownerId: "14",
      title: "Change old Macbook to new M series ",
      currentMoneyAmount: Money(
        id: "14",
        type: MoneyType.stuck,
        amount: 1250,
        stuckId: "14",
        userId: "14",
      ),
      moneyAmount: Money(
        id: "14",
        type: MoneyType.stuck,
        amount: 3500,
        stuckId: "14",
        userId: "14",
      ),
      urgency: StuckUrgency.satisfying,
    ),
  ];
}
