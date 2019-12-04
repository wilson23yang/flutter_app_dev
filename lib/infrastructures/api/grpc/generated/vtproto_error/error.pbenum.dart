///
//  Generated code. Do not modify.
//  source: vtproto_error/error.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class ErrorCode extends $pb.ProtobufEnum {
  static const ErrorCode NOERROR = ErrorCode._(0, 'NOERROR');
  static const ErrorCode ERROR = ErrorCode._(1000, 'ERROR');
  static const ErrorCode NOT_FOUND = ErrorCode._(1001, 'NOT_FOUND');
  static const ErrorCode WRONG_PASSWORD = ErrorCode._(1002, 'WRONG_PASSWORD');
  static const ErrorCode DUP = ErrorCode._(1003, 'DUP');
  static const ErrorCode NOT_LOGIN = ErrorCode._(1004, 'NOT_LOGIN');
  static const ErrorCode WRONG_VERIFY_CODE = ErrorCode._(1005, 'WRONG_VERIFY_CODE');
  static const ErrorCode NEED_TO_BIND_CELL_PHONE_NUMBER = ErrorCode._(1006, 'NEED_TO_BIND_CELL_PHONE_NUMBER');
  static const ErrorCode DO_NOT_HAVA_ENOUGH_COIN = ErrorCode._(1007, 'DO_NOT_HAVA_ENOUGH_COIN');
  static const ErrorCode COOL_DOWN = ErrorCode._(1008, 'COOL_DOWN');
  static const ErrorCode WITHDRAW_DISABLE = ErrorCode._(1009, 'WITHDRAW_DISABLE');

  static const $core.List<ErrorCode> values = <ErrorCode> [
    NOERROR,
    ERROR,
    NOT_FOUND,
    WRONG_PASSWORD,
    DUP,
    NOT_LOGIN,
    WRONG_VERIFY_CODE,
    NEED_TO_BIND_CELL_PHONE_NUMBER,
    DO_NOT_HAVA_ENOUGH_COIN,
    COOL_DOWN,
    WITHDRAW_DISABLE,
  ];

  static final $core.Map<$core.int, ErrorCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ErrorCode valueOf($core.int value) => _byValue[value];

  const ErrorCode._($core.int v, $core.String n) : super(v, n);
}

