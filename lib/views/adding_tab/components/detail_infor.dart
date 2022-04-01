import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

import '../../../widgets/inkwell_row_button.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({Key? key}) : super(key: key);

  Widget _personEventAndReminder() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: S.dimens.padding),
      padding: EdgeInsets.symmetric(
          horizontal: S.dimens.padding, vertical: S.dimens.smallPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: S.colors.textOnPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: S.colors.shadowElevationColor,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 6), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          InkWellRowButton(
            onTap: () {},
            iconData: Icons.group,
            hintText: 'Với',
          ),
          SizedBox(height: S.dimens.tinyPadding),
          InkWellRowButton(
            onTap: () {},
            iconData: Icons.calendar_today,
            hintText: 'Chọn sự kiện',
          ),
          SizedBox(height: S.dimens.tinyPadding),
          InkWellRowButton(
            onTap: () {},
            iconData: Icons.add_alert,
            hintText: 'Đặt lời nhắc',
          ),
          SizedBox(height: S.dimens.tinyPadding),
          IntrinsicHeight(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.image,
                      color: S.colors.iconColor,
                    ),
                  ),
                  VerticalDivider(
                    width: S.dimens.padding,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: S.colors.primaryColor,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.photo_camera,
                      color: S.colors.iconColor,
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: _personEventAndReminder(),
    );
  }
}
