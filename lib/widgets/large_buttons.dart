import 'package:flutter/material.dart';
import 'package:flutter_payment_app/component/colors.dart';

class AppLargeButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function() onTap;
  final bool isBorder;
  final double size;

  AppLargeButton({
    Key key,
    @required this.text,
    this.backgroundColor: AppColor.mainColor,
    this.onTap,
    this.isBorder: false,
    this.textColor,
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        width: MediaQuery.of(context).size.width - 60,
        height: 60,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1.5, color: AppColor.mainColor)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: size,
            ),
          ),
        ),
      ),
    );
  }
}
