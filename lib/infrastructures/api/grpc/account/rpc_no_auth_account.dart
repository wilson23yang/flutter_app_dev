import 'dart:async';
import 'dart:convert';
import 'package:app_dev/infrastructures/api/api_request.dart';
import 'package:app_dev/infrastructures/api/grpc/account/LoginInfoRsp.dart';
import 'package:app_dev/infrastructures/api/grpc/generated/vtproto_account/account.pb.dart';
import 'package:app_dev/infrastructures/api/grpc/grpc_manager.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:meta/meta.dart';
import 'package:fixnum/fixnum.dart';


///
Future<RegisterRes> register({@required String name,@required String password,@required String inviteCode}){
  return ApiRequest.grpcFuture(
    tag: 'register',
    request: () async {
      var pwd = Utf8Encoder().convert(password);
      var digest = md5.convert(pwd);
      return RegisterReq()..name=name..passwordMd5=hex.encode(digest.bytes)..parentCode=Int64(int.parse(inviteCode));
    },
    grpcCall: (request) => GRPCManager.getAccountNoAuthClient().register(request),
    response: ({rsp,headers}) => rsp,
  );
}

///
Future<LoginInfoRsp> login({@required String name,@required String password,}){
  return ApiRequest.grpcFuture(
      tag: 'login',
      request: () async {
        var pwd = Utf8Encoder().convert(password);
        var digest = md5.convert(pwd);
        return LoginReq()..name=name..passwordMd5=hex.encode(digest.bytes);
      },
      grpcCall: (request) => GRPCManager.getAccountNoAuthClient().login(request),
      response: ({rsp,headers}){
        return LoginInfoRsp(loginRes: rsp,token: rsp?.token,code: rsp.code.toInt(),name: name);
      }
  );
}



