import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ckh_app/common/routes.dart';
import 'package:ckh_app/middleware/app_middleware.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';

import 'common/storage.dart';
void main() {
//   if(Platform.isIOS){
//     BMFMapSDK.setApiKeyAndCoordType(
//         'c2QnQTSKYmEISdMy06G7WhVnlFe7B9hv', BMF_COORD_TYPE.BD09LL);
//   }else if(Platform.isAndroid){
// // Android 目前不支持接口设置Apikey,
// // 请在主工程的Manifest文件里设置，详细配置方法请参考[https://lbsyun.baidu.com/ 官网][https://lbsyun.baidu.com/)demo
//     BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);}
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: AppStorage.getInstance(), builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        final bool isFirstOpen = !(AppStorage.getBool('isFirstOpen') == true);
        return ScreenUtilInit(
          designSize: Size(750, 1334),
          allowFontScaling: true,
          builder: () => GetMaterialApp(
            title: '创客汇',
            builder: (context, child){
              return EasyLoading.init()(context, Scaffold(
                // Global GestureDetector that will dismiss the keyboard
                  body: GestureDetector(
                    onTap: () {
                      hideKeyboard(context);
                    },
                    child:  child,
                  )));
            },
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            initialRoute: RouteConfig.main_page,
            onInit: AppMiddleWare.onInit,
            onReady: AppMiddleWare.onReady(),
            routingCallback: AppMiddleWare.RoutingCallback,
            defaultTransition: Transition.cupertino,
            getPages: RouteConfig.getPages,
          ),
        );
      }
      return SizedBox();
    });
  }
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus.unfocus();
  }
}


