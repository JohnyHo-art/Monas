import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  String _getGreeting() {
    int currentHour = DateTime.now().hour;
    if (currentHour >= 0 && currentHour <= 10) {
      return 'Buổi sáng tốt lành,';
    } else if (currentHour > 10 && currentHour <= 17) {
      return 'Chào buổi chiều,';
    } else {
      return 'Buổi tối vui vẻ,';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getGreeting(),
                style: S.bodyTextStyles.body1(S.colors.subTextColor2),
              ),
              Text(
                //TODO: Add user name
                'User name',
                style: S.headerTextStyles.header2(S.colors.primaryColor),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: S.colors.primaryColorShadeThirty,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: S.colors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
