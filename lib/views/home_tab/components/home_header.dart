import 'package:flutter/material.dart';
import 'package:monas/viewmodels/authentication/authentic_vm.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  String _getGreeting() {
    int currentHour = DateTime.now().hour;
    if (currentHour >= 0 && currentHour <= 10) {
      return 'Buổi sáng tốt lành,';
    } else if (currentHour > 10 && currentHour <= 17) {
      return 'Chào buổi trưa,';
    } else {
      return 'Buổi tối vui vẻ,';
    }
  }

  @override
  Widget build(BuildContext context) {

    final authentication = context.watch<AuthenticViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getGreeting(),
                  style: S.bodyTextStyles.body1(S.colors.subTextColor2),
                ),
                Text(
                  authentication.monasUser.name,
                  overflow: TextOverflow.ellipsis,
                  style: S.headerTextStyles.header2(S.colors.primaryColor),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () =>
                  Provider.of<AuthenticViewModel>(context, listen: false)
                      .signOut(context),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: S.colors.subTextColor,
                borderRadius:
                    BorderRadius.circular(S.dimens.cardCornerRadiusSmall),
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
        ),
      ],
    );
  }
}
