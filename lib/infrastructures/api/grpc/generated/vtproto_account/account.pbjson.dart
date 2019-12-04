///
//  Generated code. Do not modify.
//  source: vtproto_account/account.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const RegisterReq$json = const {
  '1': 'RegisterReq',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'password_md5', '3': 2, '4': 1, '5': 9, '10': 'passwordMd5'},
    const {'1': 'parent_code', '3': 3, '4': 1, '5': 3, '10': 'parentCode'},
  ],
};

const RegisterRes$json = const {
  '1': 'RegisterRes',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.vtproto.error.Error', '10': 'error'},
    const {'1': 'account_id', '3': 2, '4': 1, '5': 9, '10': 'accountId'},
  ],
};

const LoginReq$json = const {
  '1': 'LoginReq',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'password_md5', '3': 2, '4': 1, '5': 9, '10': 'passwordMd5'},
  ],
};

const LoginRes$json = const {
  '1': 'LoginRes',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.vtproto.error.Error', '10': 'error'},
    const {'1': 'code', '3': 2, '4': 1, '5': 3, '10': 'code'},
    const {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
  ],
};

const LogoutReq$json = const {
  '1': 'LogoutReq',
};

const LogoutRes$json = const {
  '1': 'LogoutRes',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.vtproto.error.Error', '10': 'error'},
  ],
};

