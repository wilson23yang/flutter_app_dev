///
//  Generated code. Do not modify.
//  source: vtproto_error/error.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ErrorCode$json = const {
  '1': 'ErrorCode',
  '2': const [
    const {'1': 'NOERROR', '2': 0},
    const {'1': 'ERROR', '2': 1000},
    const {'1': 'NOT_FOUND', '2': 1001},
    const {'1': 'WRONG_PASSWORD', '2': 1002},
    const {'1': 'DUP', '2': 1003},
    const {'1': 'NOT_LOGIN', '2': 1004},
    const {'1': 'WRONG_VERIFY_CODE', '2': 1005},
    const {'1': 'NEED_TO_BIND_CELL_PHONE_NUMBER', '2': 1006},
    const {'1': 'DO_NOT_HAVA_ENOUGH_COIN', '2': 1007},
    const {'1': 'COOL_DOWN', '2': 1008},
    const {'1': 'WITHDRAW_DISABLE', '2': 1009},
  ],
};

const Error$json = const {
  '1': 'Error',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.vtproto.error.ErrorCode', '10': 'code'},
  ],
};

