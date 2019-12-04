///
//  Generated code. Do not modify.
//  source: vtproto_account/account.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core show int, String, List;

import 'package:grpc/service_api.dart' as $grpc;
import 'account.pb.dart' as $0;
export 'account.pb.dart';

class AccountNoAuthServiceClient extends $grpc.Client {
  static final _$register = $grpc.ClientMethod<$0.RegisterReq, $0.RegisterRes>(
      '/vtproto.account.AccountNoAuthService/Register',
      ($0.RegisterReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RegisterRes.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginReq, $0.LoginRes>(
      '/vtproto.account.AccountNoAuthService/Login',
      ($0.LoginReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginRes.fromBuffer(value));

  AccountNoAuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.RegisterRes> register($0.RegisterReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$register, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.LoginRes> login($0.LoginReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$login, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AccountNoAuthServiceBase extends $grpc.Service {
  $core.String get $name => 'vtproto.account.AccountNoAuthService';

  AccountNoAuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterReq, $0.RegisterRes>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterReq.fromBuffer(value),
        ($0.RegisterRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginReq, $0.LoginRes>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginReq.fromBuffer(value),
        ($0.LoginRes value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterRes> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterReq> request) async {
    return register(call, await request);
  }

  $async.Future<$0.LoginRes> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginReq> request) async {
    return login(call, await request);
  }

  $async.Future<$0.RegisterRes> register(
      $grpc.ServiceCall call, $0.RegisterReq request);
  $async.Future<$0.LoginRes> login($grpc.ServiceCall call, $0.LoginReq request);
}

class AccountServiceClient extends $grpc.Client {
  static final _$logout = $grpc.ClientMethod<$0.LogoutReq, $0.LogoutRes>(
      '/vtproto.account.AccountService/Logout',
      ($0.LogoutReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LogoutRes.fromBuffer(value));

  AccountServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.LogoutRes> logout($0.LogoutReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$logout, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class AccountServiceBase extends $grpc.Service {
  $core.String get $name => 'vtproto.account.AccountService';

  AccountServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LogoutReq, $0.LogoutRes>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogoutReq.fromBuffer(value),
        ($0.LogoutRes value) => value.writeToBuffer()));
  }

  $async.Future<$0.LogoutRes> logout_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LogoutReq> request) async {
    return logout(call, await request);
  }

  $async.Future<$0.LogoutRes> logout(
      $grpc.ServiceCall call, $0.LogoutReq request);
}
