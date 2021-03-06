import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {

  final String labelText;

  Search(this.labelText, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(64),
      decoration: BoxDecoration(
          color: AppColors.COLOR_GRAY_F7F7F7,
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(64))
      ),
      child: Row(
        children: [
          Container(width: 40, child: Image.asset(AppImages.SEARCH_ICON, width: ScreenUtil().setWidth(47), height: ScreenUtil().setWidth(47)),) ,
          Expanded(child: TextField(
            cursorColor: AppColors.COLOR_PRIMARY_D22315,
            style: TextStyle(fontSize: ScreenUtil().setSp(28), color: AppColors.COLOR_BLACK_333333),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(fontSize: ScreenUtil().setSp(28), color: AppColors.COLOR_GRAY_CCCCCC),
              contentPadding: EdgeInsets.only(bottom: 15),
              hasFloatingPlaceholder: false,
              focusColor:  AppColors.COLOR_PRIMARY_D22315,
              border: InputBorder.none,
            ),
          ))
        ],
      ),
    );
  }
}