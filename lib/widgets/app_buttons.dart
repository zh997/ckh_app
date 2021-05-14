import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ckh_app/constant/app_colors.dart';

class PrimaryButton extends StatelessWidget {

  final String buttonText;
  final bool disabled;
  final double width;
  final double height;
  final double radius;
  final Color color;
  final bool isLine;
  final Function onTap;
  PrimaryButton(this.buttonText, {this.width = 690, this.height = 98, this.radius = 4, this.color, this.isLine = false, this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: disabled ? () {} : onTap,
      child: Opacity(
        opacity: disabled ? 0.3 : 1.0,
        child: Container(
          alignment: Alignment.center,
          width: ScreenUtil().setWidth(this.width),
          height: ScreenUtil().setWidth(this.height),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color:  color ?? AppColors.COLOR_31C27A),
              color: isLine ? Colors.transparent : color ?? AppColors.COLOR_31C27A,
              borderRadius: BorderRadius.circular(radius)
          ),
          child: Text(buttonText, style: TextStyle(fontSize: ScreenUtil().setSp(32), color: isLine ? AppColors.COLOR_31C27A : Colors.white)),
        ),
      ),
    );
  }

}