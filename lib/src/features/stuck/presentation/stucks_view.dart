import 'package:flutter/material.dart';

import '../../../../stuck_my_money.dart';
import '../../../shared/extensions.dart';
import '../models/stuck_model.dart';
import 'stuck_view.dart';

class Stucks extends StatelessWidget {
  const Stucks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double totalUserMoney = user.currentMoney?.amount ?? 0;

    double calculateTotalUrgencyPercentages() {
      double per = totalUserMoney /
          Stuck.dummyDatas.map((stuck) => stuck.urgency.percent).fold<double>(
              0, (previousValue, element) => previousValue + element);

      double pers = Stuck.dummyDatas
          .map((s) => (s.urgency.percent * per))
          .fold(0, (previousValue, element) => previousValue + element);

      print("total percentage $pers");

      return pers;
    }

    final double totalUrgencyPercentages = calculateTotalUrgencyPercentages();

    return Expanded(
      child: ListView.builder(
        itemCount: Stuck.dummyDatas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: context.appHorizontalPadding,
              right: context.appHorizontalPadding,
              bottom: context.appVerticalPadding,
              top: index < 1 ? context.appVerticalPadding : 0,
            ),
            child: StuckView(
              stuck: Stuck.dummyDatas[index],
              urgencyPercentages: totalUrgencyPercentages,
              computeTotalMoney: (fixedAmount) => totalUserMoney - fixedAmount,
            ),
          );
        },
      ),
    );
  }
}

// class Stucks extends StatelessWidget {
//   const Stucks({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    // double totalUserMoney = user.currentMoney?.amount ?? 0;
    // double urgencyPercentages = Stuck.dummyDatas
    //     .map((stuck) => stuck.urgency.percent)
    //     .toList()
    //     .fold<double>(0, (previousValue, element) => previousValue + element);

    // void hesapla() {
    //   double per = totalUserMoney / urgencyPercentages;
    //   double pers = Stuck.dummyDatas
    //       .map((s) => (s.urgency.percent * per))
    //       .toList()
    //       .fold(0, (previousValue, element) => previousValue + element);
    //   print("total percentage $pers");
    // }

    // hesapla();

//     return Expanded(
//       child: ListView.builder(
//         itemCount: Stuck.dummyDatas.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.only(
//               left: context.appHorizontalPadding,
//               right: context.appHorizontalPadding,
//               bottom: context.appVerticalPadding,
//               top: index < 1 ? context.appVerticalPadding : 0,
//             ),
//             child: StuckView(
//               stuck: Stuck.dummyDatas[index],
//               urgencyPercentages: urgencyPercentages,
//               computeTotalMoney: (fixedAmount) => totalUserMoney - fixedAmount,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
