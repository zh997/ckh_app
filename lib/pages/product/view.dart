import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:ckh_app/constant/app_radius.dart';
import 'package:ckh_app/widgets/app_search.dart';
import 'package:ckh_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ProductPage extends StatelessWidget {
  final ProductLogic logic = Get.put(ProductLogic());
  final ProductState state = Get.find<ProductLogic>().state;

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
      ),backgroundColor: Colors.white,elevation: 0,title: Text('公司产品', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
        centerTitle: true,),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Search('请输入关键字'),
          ),
          Expanded(child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: ScreenUtil().setWidth(20) ,),),
              SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return Container(
                  margin: index % 2 > 0 ? EdgeInsets.only(right: ScreenUtil().setWidth(20)) :
                  EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: ScreenUtil().setWidth(350),
                        child: Image.asset(AppImages.PRODUCT_IMG_1, fit: BoxFit.cover),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5 ,10, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('浅川の光日本原装进口高浓度光触媒抗菌', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Price(price: '0.00'),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: (){
                                    _ShowAnimateDialog(context);
                                  },
                                  child: Container(
                                    width: ScreenUtil().setWidth(90),
                                    height: ScreenUtil().setWidth(50),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.COLOR_31C27A,
                                        borderRadius: BorderRadius.circular(2)
                                    ),
                                    child: Text('下单', style: TextStyle(color: Colors.white, fontSize: AppFont.SIZE_26),),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },childCount: 10), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: ScreenUtil().setWidth(335)/ScreenUtil().setWidth(510),
                crossAxisCount: 2,
                mainAxisSpacing: ScreenUtil().setWidth(20),
                crossAxisSpacing:  ScreenUtil().setWidth(20),
              )),
              SliverToBoxAdapter(child: SizedBox(height: ScreenUtil().setWidth(20) ,),),

            ],
          ))
        ],
      ),
    );
  }

  Widget _ShowAnimateDialog(BuildContext context) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: ScreenUtil().setWidth(550),
            height: ScreenUtil().setWidth(700),
            // alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppRadius.RADIUS_20)
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('小程序扫码购买', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_36, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    Image.asset(AppImages.PAY_QRCODE, width: ScreenUtil().setWidth(360), height: ScreenUtil().setWidth(360),),
                    SizedBox(height: 10,),
                    Text('长按保存至相册', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28))
                  ],
                ),
                Positioned(top: 10, right: 10, child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Get.back(result: 'success');
                  },
                  child: Image.asset(AppImages.CLOSE_ICON, width: ScreenUtil().setWidth(32), height: ScreenUtil().setWidth(32),),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
