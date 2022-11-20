import 'package:flutter/material.dart';
import 'package:stuck_my_money/src/presentation/home/home_page.dart';
import 'package:stuck_my_money/src/shared/constants/texts.dart';

class StuckMyMoney extends StatelessWidget {
  const StuckMyMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppText.materialAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
