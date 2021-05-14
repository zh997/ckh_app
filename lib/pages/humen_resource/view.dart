import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/widgets/app_buttons.dart';
import 'package:ckh_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class HumenResourcePage extends StatelessWidget {
  final HumenResourceLogic logic = Get.put(HumenResourceLogic());
  final HumenResourceState state = Get.find<HumenResourceLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.COLOR_F5F6FA,
      appBar: AppBar(leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_rounded, size: 25, color: AppColors.COLOR_232933,)
      ),backgroundColor: Colors.white,elevation: 0,
        title: Text('人力资源', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                RowTextField(
                  key: GlobalKey(),
                  name: 'account',
                  controller: TextEditingController(),
                  title: '您的姓名：',
                  labelText: '请输入',
                  labelBottom: 10,
                  contentPaddingTop: 10,
                  labelAlignment: AlignmentDirectional.centerEnd,
                  textAlign: TextAlign.end,
                ),
                RowTextField(
                  suffixIcon: Icon(Icons.keyboard_arrow_right_rounded, color: AppColors.COLOR_CCD4E6,),
                  key: GlobalKey(),
                  name: 'account',
                  controller: TextEditingController(),
                  title: '您的姓名：',
                  labelText: '请选择',
                  labelBottom: 10,
                  contentPaddingTop: 10,
                  labelAlignment: AlignmentDirectional.centerEnd,
                  textAlign: TextAlign.end,
                  readOnly: true,
                ),
                RowTextField(
                  key: GlobalKey(),
                  name: 'account',
                  controller: TextEditingController(),
                  title: '您的电子邮箱： ',
                  labelText: '请输入',
                  labelBottom: 10,
                  contentPaddingTop: 10,
                  labelAlignment: AlignmentDirectional.centerEnd,
                  textAlign: TextAlign.end,
                ),
                RowTextField(
                  key: GlobalKey(),
                  name: 'account',
                  controller: TextEditingController(),
                  title: '您的电话号码： ',
                  labelText: '请输入',
                  labelBottom: 10,
                  contentPaddingTop: 10,
                  labelAlignment: AlignmentDirectional.centerEnd,
                  textAlign: TextAlign.end,
                ),
                RowTextField(
                  key: GlobalKey(),
                  name: 'account',
                  controller: TextEditingController(),
                  title: '职业意向：',
                  labelText: '请输入',
                  labelBottom: 10,
                  contentPaddingTop: 10,
                  labelAlignment: AlignmentDirectional.centerEnd,
                  textAlign: TextAlign.end,
                ),

              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: PrimaryButton('提交', radius: ScreenUtil().setWidth(98),),
          )
        ],
      )
    );
  }
}
