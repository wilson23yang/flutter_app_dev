import 'dart:async';
import 'package:app_dev/infrastructures/api/api_request.dart';
import 'package:app_dev/infrastructures/api/grpc/generated/vtproto_account/account.pb.dart';
import 'package:app_dev/infrastructures/api/grpc/grpc_manager.dart';
import 'package:meta/meta.dart';

///
Future<LogoutRes> logout() {
  return ApiRequest.grpcFuture(
    tag: 'logout',
    request: () async {
      return LogoutReq();
    },
    grpcCall: (request) {
      return GRPCManager.getAccountClient().logout(request);
    },
  );
}



