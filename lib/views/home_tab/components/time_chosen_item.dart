import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/time_chosen_vm.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_button.dart';

class TimeChosenItem extends StatelessWidget {
  final String text;
  final int number;
  final Function onPressed;

  const TimeChosenItem(
      {Key? key,
      required this.text,
      required this.number,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeChosen = context.watch<TimeChosenViewModel>();

    return CustomButton(
      borderColor: S.colors.whiteColor,
      height: 25,
      borderWidth: 0,
      onPressed: () => onPressed(),
      text: text,
      width: 50,
      color: timeChosen.getSelectedTime() == number
          ? S.colors.primaryColor
          : S.colors.subTextColor,
      textColor: timeChosen.getSelectedTime() == number
          ? S.colors.whiteColor
          : S.colors.textOnSecondaryColor,
    );
  }
}
