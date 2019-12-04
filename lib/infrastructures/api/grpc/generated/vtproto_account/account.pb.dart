///
//  Generated code. Do not modify.
//  source: vtproto_account/account.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import '../vtproto_error/error.pb.dart' as $1;

class RegisterReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RegisterReq', package: const $pb.PackageName('vtproto.account'))
    ..aOS(1, 'name')
    ..aOS(2, 'passwordMd5')
    ..aInt64(3, 'parentCode')
    ..hasRequiredFields = false
  ;

  RegisterReq._() : super();
  factory RegisterReq() => create();
  factory RegisterReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RegisterReq clone() => RegisterReq()..mergeFromMessage(this);
  RegisterReq copyWith(void Function(RegisterReq) updates) => super.copyWith((message) => updates(message as RegisterReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterReq create() => RegisterReq._();
  RegisterReq createEmptyInstance() => create();
  static $pb.PbList<RegisterReq> createRepeated() => $pb.PbList<RegisterReq>();
  static RegisterReq getDefault() => _defaultInstance ??= create()..freeze();
  static RegisterReq _defaultInstance;

  $core.String get name => $_getS(0, '');
  set name($core.String v) { $_setString(0, v); }
  $core.bool hasName() => $_has(0);
  void clearName() => clearField(1);

  $core.String get passwordMd5 => $_getS(1, '');
  set passwordMd5($core.String v) { $_setString(1, v); }
  $core.bool hasPasswordMd5() => $_has(1);
  void clearPasswordMd5() => clearField(2);

  Int64 get parentCode => $_getI64(2);
  set parentCode(Int64 v) { $_setInt64(2, v); }
  $core.bool hasParentCode() => $_has(2);
  void clearParentCode() => clearField(3);
}

class RegisterRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RegisterRes', package: const $pb.PackageName('vtproto.account'))
    ..a<$1.Error>(1, 'error', $pb.PbFieldType.OM, $1.Error.getDefault, $1.Error.create)
    ..aOS(2, 'accountId')
    ..hasRequiredFields = false
  ;

  RegisterRes._() : super();
  factory RegisterRes() => create();
  factory RegisterRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RegisterRes clone() => RegisterRes()..mergeFromMessage(this);
  RegisterRes copyWith(void Function(RegisterRes) updates) => super.copyWith((message) => updates(message as RegisterRes));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterRes create() => RegisterRes._();
  RegisterRes createEmptyInstance() => create();
  static $pb.PbList<RegisterRes> createRepeated() => $pb.PbList<RegisterRes>();
  static RegisterRes getDefault() => _defaultInstance ??= create()..freeze();
  static RegisterRes _defaultInstance;

  $1.Error get error => $_getN(0);
  set error($1.Error v) { setField(1, v); }
  $core.bool hasError() => $_has(0);
  void clearError() => clearField(1);

  $core.String get accountId => $_getS(1, '');
  set accountId($core.String v) { $_setString(1, v); }
  $core.bool hasAccountId() => $_has(1);
  void clearAccountId() => clearField(2);
}

class LoginReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LoginReq', package: const $pb.PackageName('vtproto.account'))
    ..aOS(1, 'name')
    ..aOS(2, 'passwordMd5')
    ..hasRequiredFields = false
  ;

  LoginReq._() : super();
  factory LoginReq() => create();
  factory LoginReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LoginReq clone() => LoginReq()..mergeFromMessage(this);
  LoginReq copyWith(void Function(LoginReq) updates) => super.copyWith((message) => updates(message as LoginReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginReq create() => LoginReq._();
  LoginReq createEmptyInstance() => create();
  static $pb.PbList<LoginReq> createRepeated() => $pb.PbList<LoginReq>();
  static LoginReq getDefault() => _defaultInstance ??= create()..freeze();
  static LoginReq _defaultInstance;

  $core.String get name => $_getS(0, '');
  set name($core.String v) { $_setString(0, v); }
  $core.bool hasName() => $_has(0);
  void clearName() => clearField(1);

  $core.String get passwordMd5 => $_getS(1, '');
  set passwordMd5($core.String v) { $_setString(1, v); }
  $core.bool hasPasswordMd5() => $_has(1);
  void clearPasswordMd5() => clearField(2);
}

class LoginRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LoginRes', package: const $pb.PackageName('vtproto.account'))
    ..a<$1.Error>(1, 'error', $pb.PbFieldType.OM, $1.Error.getDefault, $1.Error.create)
    ..aInt64(2, 'code')
    ..aOS(3, 'token')
    ..hasRequiredFields = false
  ;

  LoginRes._() : super();
  factory LoginRes() => create();
  factory LoginRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LoginRes clone() => LoginRes()..mergeFromMessage(this);
  LoginRes copyWith(void Function(LoginRes) updates) => super.copyWith((message) => updates(message as LoginRes));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRes create() => LoginRes._();
  LoginRes createEmptyInstance() => create();
  static $pb.PbList<LoginRes> createRepeated() => $pb.PbList<LoginRes>();
  static LoginRes getDefault() => _defaultInstance ??= create()..freeze();
  static LoginRes _defaultInstance;

  $1.Error get error => $_getN(0);
  set error($1.Error v) { setField(1, v); }
  $core.bool hasError() => $_has(0);
  void clearError() => clearField(1);

  Int64 get code => $_getI64(1);
  set code(Int64 v) { $_setInt64(1, v); }
  $core.bool hasCode() => $_has(1);
  void clearCode() => clearField(2);

  $core.String get token => $_getS(2, '');
  set token($core.String v) { $_setString(2, v); }
  $core.bool hasToken() => $_has(2);
  void clearToken() => clearField(3);
}

class LogoutReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LogoutReq', package: const $pb.PackageName('vtproto.account'))
    ..hasRequiredFields = false
  ;

  LogoutReq._() : super();
  factory LogoutReq() => create();
  factory LogoutReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LogoutReq clone() => LogoutReq()..mergeFromMessage(this);
  LogoutReq copyWith(void Function(LogoutReq) updates) => super.copyWith((message) => updates(message as LogoutReq));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogoutReq create() => LogoutReq._();
  LogoutReq createEmptyInstance() => create();
  static $pb.PbList<LogoutReq> createRepeated() => $pb.PbList<LogoutReq>();
  static LogoutReq getDefault() => _defaultInstance ??= create()..freeze();
  static LogoutReq _defaultInstance;
}

class LogoutRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LogoutRes', package: const $pb.PackageName('vtproto.account'))
    ..a<$1.Error>(1, 'error', $pb.PbFieldType.OM, $1.Error.getDefault, $1.Error.create)
    ..hasRequiredFields = false
  ;

  LogoutRes._() : super();
  factory LogoutRes() => create();
  factory LogoutRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LogoutRes clone() => LogoutRes()..mergeFromMessage(this);
  LogoutRes copyWith(void Function(LogoutRes) updates) => super.copyWith((message) => updates(message as LogoutRes));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogoutRes create() => LogoutRes._();
  LogoutRes createEmptyInstance() => create();
  static $pb.PbList<LogoutRes> createRepeated() => $pb.PbList<LogoutRes>();
  static LogoutRes getDefault() => _defaultInstance ??= create()..freeze();
  static LogoutRes _defaultInstance;

  $1.Error get error => $_getN(0);
  set error($1.Error v) { setField(1, v); }
  $core.bool hasError() => $_has(0);
  void clearError() => clearField(1);
}

