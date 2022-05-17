import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/account_setting_vm.dart';
import 'package:provider/provider.dart';

class DateFormatPickerDialog extends StatelessWidget {
  const DateFormatPickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountSetting = Provider.of<AccountSettingViewModel>(context);

    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: S.dimens.tinyPadding,
          vertical: S.dimens.tinyPadding,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(S.dimens.cardCornerRadiusMedium),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('ngày/tháng/năm'),
              subtitle: const Text('15/03/2022'),
              activeColor: S.colors.primaryColor,
              value: 'dd/MM/yyyy',
              groupValue: accountSetting.dateFormat,
              onChanged: (String? value) {
                accountSetting.dateFormat = value;
                accountSetting.updateDataToFirestore(context);
              },
            ),
            RadioListTile<String>(
              title: const Text('tháng/ngày/năm'),
              subtitle: const Text('03/15/2022'),
              activeColor: S.colors.primaryColor,
              value: 'MM/dd/yyyy',
              groupValue: accountSetting.dateFormat,
              onChanged: (String? value) {
                accountSetting.dateFormat = value;
                accountSetting.updateDataToFirestore(context);
              },
            ),
            RadioListTile<String>(
              title: const Text('năm/tháng/ngày'),
              subtitle: const Text('2022/03/15'),
              activeColor: S.colors.primaryColor,
              value: 'yyyy/MM/dd',
              groupValue: accountSetting.dateFormat,
              onChanged: (String? value) {
                accountSetting.dateFormat = value;
                accountSetting.updateDataToFirestore(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
