import 'package:flutter/cupertino.dart';

class DioResponseData<T> {
  int code;
  T data;
  bool result;
  String message;
  DioResponseData(this.code, this.data, this.result, this.message);
}


class ResponseData<T>{
  String info;
  dynamic data;
  int status;
  int more;
  ResponseData({this.info, this.data, this.status, this.more});

  ResponseData.fromJson(Map<String, dynamic> json, { fromJson,bool noList }) {
    // print('----------------------');
    //  print(json['data']);
    // print('----------------------');
    info = json['info'];
    if (fromJson != null && json['status'] == 1) {

      if (json['data'] is List) {
        data = new List();
        json['data'].forEach((v) {
          data.add(fromJson(v));
        });
      } else if(json['data'] is Map) {
        if (json['data']['more'] != null) {
          if (noList == true) {
            data = json['data'] != null ? fromJson(json['data']) : null;
          } else {
            if ( json['data']['list'] != null && json['data']['list'] is List) {
              data = new List();
              json['data']['list'].forEach((v) {
                data.add(fromJson(v));
              });
            }
          }
          more = json['data']['more'];
        } else {

          data = json['data'] != null ? fromJson(json['data']) : null;
        }

      }
    } else {
      data = json['data'];
    }
    status = json['status'];
  }
}


class RealResponseData<T> {
  final bool result;
  final T data;
  final int more;
  RealResponseData({@required this.result, @required this.data, this.more});
}
