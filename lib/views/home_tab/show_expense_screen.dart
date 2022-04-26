import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

class ShowExpenseScreen extends StatelessWidget {
  const ShowExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: S.colors.whiteColor,
        foregroundColor: S.colors.textOnSecondaryColor,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(),
    );
  }
}
