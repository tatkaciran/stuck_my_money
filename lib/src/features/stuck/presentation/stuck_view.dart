import 'dart:math';

import 'package:flutter/material.dart';

import '../components/progress_counter.dart';
import '../models/stuck_model.dart';

class StuckView extends StatelessWidget {
  final Stuck? stuck;
  final String? title;
  final double Function(double fixedAmount)? computeTotalMoney;
  final double urgencyPercentages;
  const StuckView({
    super.key,
    this.stuck,
    this.computeTotalMoney,
    this.title,
    this.urgencyPercentages = 0,
  });

  /// The amount that will get from total amount for each stuck.
  double computeAllowance(
    /// total mountly amount
    double totalMoney,

    /// total of all stuck's urgency percentages
    double totalUrgencyPercentages,

    /// urgency percentage for current stuck that will be computed
    double urgencyPercent,
  ) {
    return (totalMoney / totalUrgencyPercentages) * (urgencyPercent);
  }

  @override
  Widget build(BuildContext context) {
    double? fixedAmount = stuck?.mountlyFixedAmount?.amount;
    if (fixedAmount != null) {
      stuck?.copyWith(urgency: StuckUrgency.fixed);
    }

    double money = stuck?.moneyAmount.amount ?? 0.0;
    double currentMoney = stuck?.currentMoneyAmount?.amount ?? 0.0;

    return SizedBox(
      height: 250,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: stuck?.urgency.color.withOpacity(0.04),
        ),
        child: Stack(
          children: [
            BackgroundUrgencyIcon(stuck: stuck),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      stuck?.title ?? title ?? "",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.w900,
                          overflow: TextOverflow.fade),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: stuck?.urgency.color.withOpacity(0.04),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProgressCounter(
                        totalMoney: money,
                        color: stuck?.urgency.color,
                        currentMoney: currentMoney,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundUrgencyIcon extends StatelessWidget {
  const BackgroundUrgencyIcon({
    Key? key,
    required this.stuck,
  }) : super(key: key);

  final Stuck? stuck;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: -31,
      bottom: 0,
      child: Icon(
        stuck?.urgency.icon,
        color: stuck?.urgency.color.withOpacity(0.1),
        size: 300,
      ),
    );
  }
}

class StuckUrgencyChip extends StatelessWidget {
  final bool preview;
  final IconData? iconData;
  final String? label;
  final Color? color;
  final String? amount;
  final String? timeAmount;
  const StuckUrgencyChip({
    super.key,
    this.iconData,
    this.label,
    this.color,
    this.amount,
    this.preview = false,
    this.timeAmount,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        // color: color?.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Row(
          children: [
            Icon(
              Icons.attach_money_rounded,
              color: color,
            ),
            AllowanceText(
              "$amount",
              color: color,
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              iconData,
              color: color,
            ),
            if (preview == false)
              const SizedBox(
                width: 5,
              ),
            if (preview == false)
              Text(
                label ?? "",
                style: TextStyle(color: color),
              ),
          ],
        ),
      ),
    );
  }
}

class AllowanceText extends Text {
  AllowanceText(
    String title, {
    super.key,
    Color? color,
  }) : super(
          title,
          style: TextStyle(
            color: color,
          ),
        );
}

double computePercentage(double value, double totalValue) {
  return min(100, (value / totalValue * 100));
}






































// class StuckView extends StatelessWidget {
//   final Stuck? stuck;
//   final String? title;
//   final double Function(double fixedAmount)? computeTotalMoney;
//   final double urgencyPercentages;
//   const StuckView({
//     super.key,
//     this.stuck,
//     this.computeTotalMoney,
//     this.title,
//     this.urgencyPercentages = 0,
//   });

//   /// The amount that will get from total amount for each stuck.
//   double computeAllowance(
//     /// total mountly amount
//     double totalMoney,

//     /// total of all stuck's urgency percentages
//     double totalUrgencyPercentages,

//     /// urgency percentage for current stuck that will be computed
//     double urgencyPercent,
//   ) {
//     return (totalMoney / totalUrgencyPercentages) * (urgencyPercent);
//   }

//   @override
//   Widget build(BuildContext context) {
//     double? fixedAmount = stuck?.mountlyFixedAmount?.amount;
//     if (fixedAmount != null) {
//       stuck?.copyWith(urgency: StuckUrgency.fixed);
//     }
//     double totalMoney =
//         computeTotalMoney != null ? computeTotalMoney!(fixedAmount ?? 0) : 0;
//     double money = stuck?.moneyAmount.amount ?? 0.0;
//     double currentMoney = stuck?.currentMoneyAmount?.amount ?? 0.0;
//     int allowance = computeAllowance(
//       totalMoney,
//       urgencyPercentages,
//       stuck?.urgency.percent ?? 0,
//     ).floor();

//     return SizedBox(
//       height: 250,
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: stuck?.urgency.color.withOpacity(0.04),
//         ),
//         child: Stack(
//           children: [
//             Positioned(
//               top: 50,
//               right: -31,
//               bottom: 0,
//               child: Icon(
//                 stuck?.urgency.icon,
//                 color: stuck?.urgency.color.withOpacity(0.1),
//                 size: 300,
//               ),
//             ),
//             Row(
//               children: [
//                 DecoratedBox(
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       bottomLeft: Radius.circular(20),
//                     ),
//                     color: stuck?.urgency.color.withOpacity(0.04),
//                   ),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 20.0,
//                             horizontal: 8,
//                           ),
//                           child: Text(
//                             """
// total money: 3000
// remaing money: 1250
// estamatedtime: 15
// mountley money: 30""",
//                             style: TextStyle(color: stuck?.urgency.color),
//                           ),
//                         ),
//                       ),
//                       ProgressCounter(
//                         totalMoney: money,
//                         color: stuck?.urgency.color,
//                         currentMoney: currentMoney,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                         // vertical: context.appVerticalPadding / 2,
//                         // horizontal: context.appHorizontalPadding,
//                         ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               stuck?.title ?? title ?? "",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.grey.shade300,
//                                   fontWeight: FontWeight.w900,
//                                   overflow: TextOverflow.fade),
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: StuckUrgencyChip(
//                                 amount: "$allowance",
//                                 color: stuck?.urgency.color,
//                                 iconData: stuck?.urgency.icon,
//                                 label: stuck?.urgency.label,
//                                 preview: true,
//                                 timeAmount:
//                                     "${((stuck?.currentMoneyAmount?.amount ?? 0) / allowance).floor()}",
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class StuckUrgencyChip extends StatelessWidget {
//   final bool preview;
//   final IconData? iconData;
//   final String? label;
//   final Color? color;
//   final String? amount;
//   final String? timeAmount;
//   const StuckUrgencyChip({
//     super.key,
//     this.iconData,
//     this.label,
//     this.color,
//     this.amount,
//     this.preview = false,
//     this.timeAmount,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(45),
//         // color: color?.withOpacity(0.1),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 8,
//           vertical: 4,
//         ),
//         child: Row(
//           children: [
//             Icon(
//               Icons.attach_money_rounded,
//               color: color,
//             ),
//             AllowanceText(
//               "$amount",
//               color: color,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Icon(
//               iconData,
//               color: color,
//             ),
//             if (preview == false)
//               const SizedBox(
//                 width: 5,
//               ),
//             if (preview == false)
//               Text(
//                 label ?? "",
//                 style: TextStyle(color: color),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AllowanceText extends Text {
//   AllowanceText(
//     String title, {
//     super.key,
//     Color? color,
//   }) : super(
//           title,
//           style: TextStyle(
//             color: color,
//           ),
//         );
// }

// double computePercentage(double value, double totalValue) {
//   return ((value / totalValue) * 100);
// }
