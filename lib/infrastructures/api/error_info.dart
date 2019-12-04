import 'package:flutter/material.dart';

class AppErrorInfo{
  String msg;
  int code;
  dynamic data;

  AppErrorInfo({this.code,this.msg,this.data});


  static String getMsgContent({@required BuildContext context,@required int code}){
    switch (code){
      ////////////////////////////////GRPC错误状态码/////////////////////////////
      case AppErrorCode.ok:
        return '';
        break;
      default:
        return '';
        break;
    }
  }

  ///
  ///
  ///
  static bool handCommonErrorCode(int errorCode){
    switch(errorCode){
      case AppErrorCode.permissionDenied:
      case AppErrorCode.unauthenticated:
      case AppErrorCode.not_login:
        //CommonApiEvent.send(ApiEventType.GO_2_Login_Page);
        return true;
        break;
      case AppErrorCode.need_to_bind_cell_phone_number:
        //CommonApiEvent.send(ApiEventType.GO_2_Bind_Phone_page);
        return true;
        break;
      default:
        return false;
        break;
    }
  }
}

///
/// 错误码集合，集成了app端、服务端、GRPC框架的错码
/// 
/// 
class AppErrorCode{
  
  static const int ok = 0;
  
  /////////////////////////////服务端错误码///////////////////////////////////
  static const int error = 1000;
  static const int not_found = 1001;
  static const int wrong_password = 1002;
  static const int dup = 1003;
  static const int not_login = 1004;
  static const int wrong_verify_code = 1005;
  static const int need_to_bind_cell_phone_number = 1006;
  static const int do_not_hava_enough_coin = 1007;
  static const int cool_down = 1008;
  static const int withdraw_disable = 1009;

  ////////////////////////////////GRPC错误状态码/////////////////////////////
  static const cancelled = 1;
  static const unknown = 2;
  static const invalidArgument = 3;
  static const deadlineExceeded = 4;
  static const notFound = 5;
  static const alreadyExists = 6;
  static const permissionDenied = 7;
  static const resourceExhausted = 8;
  static const failedPrecondition = 9;
  static const aborted = 10;
  static const outOfRange = 11;
  static const unimplemented = 12;
  static const internal = 13;
  static const unavailable = 14;
  static const dataLoss = 15;
  static const unauthenticated = 16;
  
  /////////////////////////应用内部错误码/////////////////////////////////////
  static const int network_error = 80000;
}




