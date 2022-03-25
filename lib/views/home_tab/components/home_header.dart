import 'package:flutter/material.dart';
import 'package:monas/constants/color.dart';
import 'package:monas/constants/text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  String _getGreeting() {
    int currentHour = DateTime.now().hour;
    if(currentHour >= 0 && currentHour <= 10) {
      return 'Good morning,';
    } else if (currentHour > 10 && currentHour <= 17) {
      return 'Good afternoon,';
    } else {
      return 'Good evening,';
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
                style: BodyText.body1(subTextColor2),
              ),
              Text(
                //TODO: Add user name
                'User name',
                style: HeaderText.header2(primaryColor),
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
              color: primaryColorShadeThirty,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
