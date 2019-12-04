///
//  Generated code. Do not modify.
//  source: vtproto_error/error.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

import 'error.pbenum.dart';

export 'error.pbenum.dart';

class Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Error', package: const $pb.PackageName('vtproto.error'))
    ..aOS(1, 'message')
    ..e<ErrorCode>(2, 'code', $pb.PbFieldType.OE, ErrorCode.NOERROR, ErrorCode.valueOf, ErrorCode.values)
    ..hasRequiredFields = false
  ;

  Error._() : super();
  factory Error() => create();
  factory Error.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Error.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Error clone() => Error()..mergeFromMessage(this);
  Error copyWith(void Function(Error) updates) => super.copyWith((message) => updates(message as Error));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  Error createEmptyInstance() => create();
  static $pb.PbList<Error> createRepeated() => $pb.PbList<Error>();
  static Error getDefault() => _defaultInstance ??= create()..freeze();
  static Error _defaultInstance;

  $core.String get message => $_getS(0, '');
  set message($core.String v) { $_setString(0, v); }
  $core.bool hasMessage() => $_has(0);
  void clearMessage() => clearField(1);

  ErrorCode get code => $_getN(1);
  set code(ErrorCode v) { setField(2, v); }
  $core.bool hasCode() => $_has(1);
  void clearCode() => clearField(2);
}

