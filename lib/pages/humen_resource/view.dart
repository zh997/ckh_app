import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/widgets/app_buttons.dart';
import 'package:ckh_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';
import 'package:flutter_pickers/pickers.dart';

import 'logic.dart';
import 'state.dart';


class HumenResourcePage extends StatefulWidget {
  @override
  _HumenResourcePageState createState() => _HumenResourcePageState();
}

class _HumenResourcePageState extends State<HumenResourcePage> {
  final HumenResourceLogic logic = Get.put(HumenResourceLogic());
  final HumenResourceState state = Get.find<HumenResourceLogic>().state;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _want_jobController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();

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
                    controller: _usernameController,
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
                    controller: _sexController,
                    title: '性别：',
                    labelText: '请选择',
                    labelBottom: 10,
                    contentPaddingTop: 10,
                    labelAlignment: AlignmentDirectional.centerEnd,
                    textAlign: TextAlign.end,
                    readOnly: true,
                    onTap: (){
                      Pickers.showSinglePicker(context,
                          data: ['男', '女', '其他'],
                          selectData: '男',
                          onConfirm: (p, position) {
                            _sexController.text = p;
                          });
                    },
                  ),
                  RowTextField(
                    key: GlobalKey(),
                    name: 'account',
                    controller: _emailController,
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
                    controller: _mobileController,
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
                    controller: _want_jobController,
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
              child: PrimaryButton('提交', radius: ScreenUtil().setWidth(98), onTap: (){
                final Map<String, dynamic> data = {};
                data['username'] = _usernameController.text;
                data['sex'] = _sexController.text;
                data['email'] = _emailController.text;
                data['mobile'] = _mobileController.text;
                data['want_job'] = _want_jobController.text;
                logic.onSendMsg(data);
              },),
            )
          ],
        )
    );
  }
}
