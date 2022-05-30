import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/adding_transaction/adding_basic_info_vm.dart';
import 'package:provider/provider.dart';

class AddingNoteDialog extends StatelessWidget {
  const AddingNoteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addingTransactionViewModel =
        Provider.of<AddingBasicInfoViewModel>(context);

    return Dialog(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          height: 270,
          width: 300,
          padding: EdgeInsets.symmetric(horizontal: S.dimens.padding),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(S.dimens.cardCornerRadiusMedium),
          ),
          child: Column(
            children: [
              SizedBox(height: S.dimens.padding),
              Text('Thêm ghi chú',
                  style: S.headerTextStyles.header3(S.colors.primaryColor)),
              SizedBox(height: S.dimens.padding),
              SizedBox(
                height: 150,
                child: TextFormField(
                  controller:
                      addingTransactionViewModel.noteTextFieldController,
                  autofocus: true,
                  maxLength: 200,
                  cursorColor: S.colors.primaryColor,
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  minLines: 5,
                  decoration: InputDecoration(
                    errorMaxLines: 5,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(S.dimens.cardCornerRadiusMedium)),
                      borderSide: BorderSide(color: S.colors.iconColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(S.dimens.cardCornerRadiusMedium)),
                      borderSide: BorderSide(color: S.colors.primaryColor),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => S.colors.subTextColor)),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'HUỶ',
                        style: S.bodyTextStyles.buttonText(S.colors.iconColor),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => S.colors.primaryColorShadeThirty)),
                      onPressed: () {
                        addingTransactionViewModel.saveTransactionNote();
                        Navigator.pop(context);
                      },
                      child: Text(
                        'LƯU',
                        style:
                            S.bodyTextStyles.buttonText(S.colors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
