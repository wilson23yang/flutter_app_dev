import 'dart:io';
import 'package:app_dev/config/api.dart';
import 'package:app_dev/infrastructures/api/grpc/generated/vtproto_account/account.pbgrpc.dart';
import 'package:grpc/grpc.dart';


class GRPCManager {
  // 工厂模式
  factory GRPCManager() => _getInstance();

  static GRPCManager get instance => _getInstance();
  static GRPCManager _instance;

  static const int TIME_OUT_SECOND = 10;

  ClientChannel get channel => _channel;
  ClientChannel _channel;

  GRPCManager._internal() {
    initClientChanel();
  }

  // 初始化
  void initClientChanel() {
    ChannelCredentials credentials;
    if (TLS.Enable) {
      credentials = new ChannelCredentials.secure(
          certificates: TLS.CertPublicKey,
          authority: TLS.ServerName,
          onBadCertificate: (X509Certificate certificate, String host) {
            return true;
          });
    } else {
      credentials = const ChannelCredentials.insecure();
    }

    _channel = ClientChannel(
      GRPC_HOST,
      port: GRPC_PORT,
      options: ChannelOptions(credentials: credentials),
    );
  }

  static GRPCManager _getInstance() {
    if (_instance == null) {
      _instance = GRPCManager._internal();
    }
    return _instance;
  }

  //////////////////////////////////////////////////////////////////////////////

  static AccountServiceClient accountServiceClient;
  static AccountNoAuthServiceClient accountNoAuthServiceClient;

  static Duration timeoutDuration = new Duration(seconds: TIME_OUT_SECOND);

  ///
  static void logoutRelease() {
    accountServiceClient = null;
  }

  ///
  static void loginInit() {
    logoutRelease();

    getAccountClient();
    getAccountNoAuthClient();
  }

  ///
  static CallOptions _getOptions() {
    String token = ''; //SpUtil.getString(SP_GRPC_ACCESS_TOKEN);
    return CallOptions(
      timeout: timeoutDuration,
      metadata: {'token': token ?? ''},
    );
  }

  static CallOptions _getNoAuthOptions() {
    return CallOptions(
      timeout: timeoutDuration,
      metadata: {},
    );
  }

  ///Account Client
  static AccountServiceClient getAccountClient() {
    if (accountServiceClient == null) {
      accountServiceClient = AccountServiceClient(
        instance.channel,
        options: _getOptions(),
      );
    }
    return accountServiceClient;
  }

  ///AccountNoAuth Client
  static AccountNoAuthServiceClient getAccountNoAuthClient() {
    if(accountNoAuthServiceClient == null){
      accountNoAuthServiceClient = AccountNoAuthServiceClient(
        instance.channel,
        options: _getNoAuthOptions(),
      );
    }
    return accountNoAuthServiceClient;
  }
}
