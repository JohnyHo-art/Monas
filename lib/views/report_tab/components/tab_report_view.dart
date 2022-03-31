import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/views/report_tab/components/label_money.dart';

class TabReportView extends StatelessWidget {
  const TabReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(S.dimens.padding),
                child: Text(
                  "Số dư",
                  style: S.headerTextStyles.header3(
                    S.colors.primaryColor,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Expanded(
                    child: LabelMoney(
                      label: "Số dư đầu",
                      money: "1.250.000",
                      dotAppear: false,
                    ),
                  ),
                  Expanded(
                    child: LabelMoney(
                      label: "Số dư cuối",
                      money: "1.650.000",
                      dotAppear: false,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    S.dimens.padding, S.dimens.padding, S.dimens.padding, 0),
                child: Container(
                  height: 1,
                  color: S.colors.subTextColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(S.dimens.padding),
                child: Text(
                  "Khoản thu & chi tiêu",
                  style: S.headerTextStyles.header3(
                    S.colors.primaryColor,
                  ),
                ),
              ),
              const LabelMoney(
                label: "Thu nhập ròng",
                money: "400.000",
                dotAppear: false,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.green[300],
                  height: 300,
                ),
              ),
              LabelMoney(
                label: "Khoản thu",
                dotColor: S.colors.backgroundIcon2,
                money: "1.500.000",
                moneyColor: S.colors.backgroundIcon2,
                dotAppear: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.grey[500],
                  height: 100,
                ),
              ),
              LabelMoney(
                label: "Khoản chi",
                dotColor: S.colors.redColor,
                money: "700.000",
                moneyColor: S.colors.redColor,
                dotAppear: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.yellow[200],
                  height: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(S.dimens.padding),
                child: Container(
                  height: 1,
                  color: S.colors.subTextColor,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: LabelMoney(
                      label: "Nợ",
                      money: "200.000",
                      moneyColor: S.colors.backgroundIcon2,
                      dotAppear: false,
                    ),
                  ),
                  Expanded(
                    child: LabelMoney(
                      label: "Cho vay",
                      money: "700.000",
                      moneyColor: S.colors.redColor,
                      dotAppear: false,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(S.dimens.padding),
                child: Container(
                  height: 1,
                  color: S.colors.subTextColor,
                ),
              ),
              const LabelMoney(
                label: "Khác",
                money: "200.000",
                dotAppear: false,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
