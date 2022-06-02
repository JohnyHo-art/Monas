import 'dart:io';

import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/viewmodels/adding_transaction/detail_info_vm.dart';
import 'package:monas/viewmodels/adding_transaction/pick_image_vm.dart';
import 'package:provider/provider.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({Key? key}) : super(key: key);

  Widget _personEventAndReminder(BuildContext context) {
    var detailInfo = context.watch<DetailInfoViewmodel>();
    var pickImage = context.watch<PickImage>();

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
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.group),
            title: Text(
              detailInfo.getWithPerson() == ""
                  ? 'Với'
                  : detailInfo.getWithPerson(),
              style: S.bodyTextStyles.buttonText(S.colors.subTextColor2),
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => Navigator.pushNamed(context, Routes.listContactScreen),
          ),
          SizedBox(height: S.dimens.smallPadding),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    pickImage.pickImagesFromLib();
                  },
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
                  onPressed: () {
                    pickImage.pickImageFromCam();
                  },
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
      child: _personEventAndReminder(context),
    );
  }
}
