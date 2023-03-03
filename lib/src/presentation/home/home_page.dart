import 'package:flutter/material.dart';

import '../../features/stuck/presentation/stucks_view.dart';
import 'components/appbar.dart';
import 'components/balance_info_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            UIAppBar(),
            BalanceInfoCard(),
            Stucks(),
          ],
        ),
      ),
    );
  }
}
