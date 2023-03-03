import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stuck_my_money/src/features/stuck/models/user_model.dart';
import 'package:stuck_my_money/src/presentation/home/home_page.dart';
import 'package:stuck_my_money/src/shared/constants/texts.dart';

part 'src/shared/locator.dart';

/// This class defines the main app, "StuckMyMoney".
class StuckMyMoney extends StatelessWidget {
  const StuckMyMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppText.materialAppTitle,
      themeMode: theme.themeMode,
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      home: const Scaffold(
        body: Center(child: HomePage()),
      ),
    );
  }
}
