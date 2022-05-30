import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({Key? key}) : super(key: key);

  Widget _personEventAndReminder() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: S.dimens.largePadding),
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
          ListTile(
            leading: const Icon(Icons.group),
            title: Text(
              'Với',
              style: S.bodyTextStyles.buttonText(S.colors.subTextColor2),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(
              'Chọn sự kiện',
              style: S.bodyTextStyles.buttonText(S.colors.subTextColor2),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add_alert),
            title: Text(
              'Đặt lời nhắc',
              style: S.bodyTextStyles.buttonText(S.colors.subTextColor2),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: S.dimens.smallPadding),
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
