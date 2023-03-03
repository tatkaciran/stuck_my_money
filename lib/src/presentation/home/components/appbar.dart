import 'package:flutter/material.dart';
import 'package:stuck_my_money/src/shared/extensions.dart';

class UIAppBar extends StatelessWidget {
  const UIAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.appHorizontalPadding + 10,
        vertical: context.appVerticalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome back,",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Batuhan Cat Acar",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade300,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade900,
            radius: 30,
          )
        ],
      ),
    );
  }
}
