import 'package:app_dev/infrastructures/api/grpc/generated/vtproto_account/account.pb.dart';

class LoginInfoRsp{
  LoginRes loginRes;
  String token;
  String name;
  int code;

  LoginInfoRsp({this.loginRes,this.token,this.name,this.code});
}