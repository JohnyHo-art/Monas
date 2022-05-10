import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/constants/routes.dart';
import 'package:monas/viewmodels/account_setting_vm.dart';
import 'package:monas/viewmodels/authentic_vm.dart';
import 'package:monas/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: S.colors.whiteColor,
          title: Text(
            'Tài khoản',
            style: S.headerTextStyles.header2(null),
          ),
          elevation: 0,
        ),
        backgroundColor: S.colors.appBackground,
        body: Column(
          children: const [
            _NameSection(),
            Expanded(child: _SettingSection()),
          ],
        ),
      ),
    );
  }
}

/*-- Name section --*/
class _NameSection extends StatelessWidget {
  const _NameSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authentication = context.watch<AuthenticViewModel>();

    // Get the current user's email if null return unknown
    final String email = FirebaseAuth.instance.currentUser!.email ?? 'Unknown';

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(S.dimens.cardCornerRadiusBig),
          bottomRight: Radius.circular(S.dimens.cardCornerRadiusBig),
        ),
        color: S.colors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle avatar
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: S.colors.primaryColor, width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(S.dimens.padding),
                      child: Text(
                        email[0].toUpperCase(),
                        style:
                            S.headerTextStyles.header1(S.colors.primaryColor),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.check_circle,
                    color: FirebaseAuth.instance.currentUser!.emailVerified
                        ? S.colors.secondaryColor
                        : S.colors.subTextColor,
                    size: S.dimens.iconSize,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: S.dimens.tinyPadding),
          // User name and email
          Padding(
            padding: EdgeInsets.symmetric(horizontal: S.dimens.largePadding),
            child: Text(
              Provider.of<AccountSettingViewModel>(context).userName,
              style: S.headerTextStyles.header2(S.colors.primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
            child: Text(
              FirebaseAuth.instance.currentUser!.email ?? 'Unknown email',
              style: S.bodyTextStyles.body1(S.colors.subTextColor2),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: S.dimens.padding),
          Visibility(
            visible: !FirebaseAuth.instance.currentUser!.emailVerified,
            child: Column(
              children: [
                CustomButton(
                  color: S.colors.primaryColorLight.withOpacity(0.3),
                  textColor: S.colors.primaryColor,
                  onPressed: () {
                    authentication.sendEmailVerification();
                    authentication.signOut(context);
                  },
                  text: 'GỬI EMAIL XÁC THỰC',
                  borderColor: S.colors.whiteColor,
                ),
                SizedBox(height: S.dimens.padding),
              ],
            ),
          ),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: S.colors.subTextColor,
              borderRadius:
                  BorderRadius.circular(S.dimens.cardCornerRadiusMedium),
            ),
          ),
          SizedBox(height: S.dimens.tinyPadding),
        ],
      ),
    );
  }
}

/*-- Settings section --*/
class _SettingSection extends StatelessWidget {
  const _SettingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authentication = context.watch<AuthenticViewModel>();

    final accountSetting = Provider.of<AccountSettingViewModel>(context);

    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.account_balance_wallet),
          title: const Text('Ví của tôi'),
          onTap: () => Navigator.pushNamed(context, Routes.walletListScreen),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: const Icon(Icons.payments),
          title: const Text('Sổ nợ'),
          onTap: () {},
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        Divider(
          thickness: 1,
          color: S.colors.subTextColor2,
        ),
        ListTile(
          title: const Text('Chọn định dạng ngày tháng'),
          subtitle: Text(DateFormat(accountSetting.dateFormat)
              .format(DateTime.now())),
          onTap: () => accountSetting.showDateFormatPickerDialog(context),
        ),
        ListTile(
          title: const Text('Nhắc thêm giao dịch hàng ngày'),
          subtitle:
              Text(DateFormat.Hm().format(accountSetting.notificationTime)),
          onTap: () => accountSetting.pickTime(context),
        ),
        ListTile(
          title: const Text('Phát âm thanh khi thông báo'),
          onTap: () {
            accountSetting.soundNotificationOn =
                !accountSetting.soundNotificationOn;
            accountSetting.updateDataToFirestore(context);
          },
          trailing: Switch(
            value: accountSetting.soundNotificationOn,
            inactiveTrackColor: S.colors.subTextColor,
            activeColor: S.colors.primaryColor,
            onChanged: (bool value) {
              accountSetting.soundNotificationOn = value;
              accountSetting.updateDataToFirestore(context);
            },
          ),
        ),
        Divider(
          thickness: 1,
          color: S.colors.subTextColor2,
        ),
        ListTile(
          title: const Text('Chúng tôi là ai?'),
          onTap: () {},
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2 * S.dimens.largePadding),
          child: CustomButton(
            color: S.colors.redColor,
            borderColor: S.colors.redColor,
            onPressed: () => authentication.signOut(context),
            text: 'ĐĂNG XUẤT!',
          ),
        ),
        SizedBox(height: S.dimens.largePadding + S.dimens.smallPadding),
      ],
    );
  }
}
