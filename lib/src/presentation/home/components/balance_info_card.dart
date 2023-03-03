import 'package:flutter/material.dart';
import 'package:stuck_my_money/src/shared/extensions.dart';
import 'package:stuck_my_money/stuck_my_money.dart';

class BalanceInfoCard extends StatelessWidget {
  const BalanceInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double amount = user.currentMoney?.amount ?? 0;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.deepPurple.withOpacity(0.15),
      ),
      child: SizedBox(
        height: context.height10,
        width: context.appHorizontalPaddingExcepted,
        child: Center(
          child: Text(
            "$amount",
            style: TextStyle(
              color: Colors.grey.shade300,
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
        ),
      ),
    );
  }
}
