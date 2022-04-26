import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

class WalletTab extends StatelessWidget {
  const WalletTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TabBar(
        indicatorColor: S.colors.primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [
          Tab(text: 'TÍNH VÀO TỔNG'),
          Tab(text: 'KHÔNG TÍNH VÀO TỔNG'),
        ],
      ),
    );
  }
}
