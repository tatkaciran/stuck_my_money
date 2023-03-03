import 'package:flutter/material.dart';

import '../../../shared/extensions.dart';
import '../presentation/stuck_view.dart';

class ProgressCounter extends StatelessWidget {
  final double totalMoney;
  final double currentMoney;
  final Color? color;
  const ProgressCounter({
    Key? key,
    this.color = Colors.white,
    required this.totalMoney,
    required this.currentMoney,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int percent = computePercentage(currentMoney, totalMoney).floor();
    return FittedBox(
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "$totalMoney",
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w900,
                color: color?.withOpacity(0.13),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "$currentMoney",
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
