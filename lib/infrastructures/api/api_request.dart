import 'package:app_dev/infrastructures/api/error_info.dart';
import 'package:app_dev/infrastructures/api/grpc/grpc_manager.dart';
import 'package:app_dev/utils/log_util.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';



//////////////////////////////////////////////////////////////////////////////

///
///
/// 
typedef GRPCRequest<K> = Future<K> Function() ;

///
///
///
typedef GRPCResponse<T> = T Function({dynamic rsp,dynamic headers}) ;

///
///
///
typedef GRPCCall= dynamic Function(Object request) ;


///
///
///
typedef RequestStream<K> = K Function();

///
///
///
typedef GRPCResponseStream<T> = Stream<T> Function(Object request) ;

///
///
///
typedef TransferFunction<T,K> = T Function(K k) ;

///
///
///
typedef HttpResponseFuture<T extends BaseResponse> = Future<T> Function() ;

//////////////////////////////////////////////////////////////////////////////


///
/// 接口响应拦截处理器
///
class ApiRequest{

  static Map<String,dynamic> callMap = {};


  ///
  /// 处理Future
  ///
  static Future<T> grpcFuture<T,K>({@required String tag, @required GRPCCall grpcCall,@required GRPCRequest<K> request,GRPCResponse<T> response,bool printDebugLog = true,bool cancelDoubleCall = false}) async {
    try{
      K param = request != null ? await request() : null;
      _printGrpcReqParams(tag,param,printDebugLog);
      var call = grpcCall(param);
      if(callMap.containsKey(tag) && cancelDoubleCall){
        callMap[tag]?.cancel();
      }
      callMap[tag] = call;
      var rsp = await (call as Future);
      var headers = await call?.headers;
      if(printDebugLog){
        LogUtil.v('',tag: '\n////////////////////////正常处理响应-S///////////////////////////');
        LogUtil.v('\n\n${rsp.runtimeType}\n$rsp',tag: '[ GRPC ] Tag: < $tag >');
        LogUtil.v('',tag: '////////////////////////正常处理响应-E///////////////////////////\n');
      }
      if(rsp?.error != null && rsp?.error?.code?.value != 0){
        if(AppErrorInfo.handCommonErrorCode(rsp?.error?.code?.value)){
          return Future.error(AppErrorInfo()..code=rsp?.error?.code?.value..msg='');
        } else {
          return Future.error(AppErrorInfo()..code=rsp?.error?.code?.value..msg=''..data=rsp);
        }
      }
      if(callMap.containsKey(tag)){
        callMap.remove(tag);
      }
      return response == null ? rsp : response(rsp:rsp,headers:headers);
    } catch(error){
      GRPCManager.instance.initClientChanel();
      if(callMap.containsKey(tag)){
        callMap.remove(tag);
      }
      if(printDebugLog){
        LogUtil.v('',tag: '\n////////////////////////处理异常响应-S///////////////////////////');
        LogUtil.v('\n\n',tag: '[ GRPC ] Tag: < $tag >');
      }
      AppErrorInfo errorInfo = new AppErrorInfo();
      if(error is GrpcError){
        String msg = Uri.decodeComponent(error?.message);
        if(error.code == StatusCode.unauthenticated){
          if(msg.contains('token')){
            //AppManager().tokenExpiredBlock();
          }
        }
        if(printDebugLog){
          LogUtil.e('Grpc error info: \ncode: ${error?.code}     \nmessage: ${Uri.decodeComponent(error?.message)}',tag: '');
          LogUtil.e(error,tag: tag);
        }
        errorInfo..msg=msg..code=error.code;
      } /*else if(error is CoustomGrpcError.Error ){
        errorInfo..msg=error.message..code=error.code.value;
      }*/ else {
        var msg = error;
        if(printDebugLog){
          LogUtil.e('Grpc error info:\nmessage:$msg',tag: '');
        }
        errorInfo..msg=msg.toString()..code=80000;
      }
      if(printDebugLog){
        LogUtil.v('',tag: '//////////////////////处理异常响应-E//////////////////////////////\n');
      }
      AppErrorInfo.handCommonErrorCode(errorInfo.code);
      return Future.error(errorInfo);
    }
  }

  ///
  /// 处理Stream
  ///
  static Stream<T> grpcStream<T,K>({@required String tag,@required GRPCResponseStream<T> response,RequestStream<K> request,bool printDebugLog = true}) {
    K param = request != null ? request() : null;
    _printGrpcReqParams(tag,param,printDebugLog);
    return response(request).map((T t){
      if(printDebugLog){
        LogUtil.v('',tag: '\n////////////////////////正常处理响应-S///////////////////////////');
        LogUtil.v('\n\n${t.runtimeType}\n$t',tag: '[ GRPC ] Tag: < $tag >');
        LogUtil.v('',tag: '////////////////////////正常处理响应-E///////////////////////////\n');
      }
      return t;
    }).handleError((error){
      GRPCManager.instance.initClientChanel();
      if(printDebugLog){
        LogUtil.v('',tag: '\n////////////////////////处理异常响应-S///////////////////////////');
        LogUtil.v('\n\n',tag: '[ GRPC ] Tag: < $tag >');
      }
      var msg;
      if(error is GrpcError){
        msg = Uri.decodeComponent(error?.message);
        if(error.code == StatusCode.unauthenticated){
          if(msg.contains('token')){
            //AppManager().tokenExpiredBlock();
          }
        }
        if(printDebugLog){
          LogUtil.e('Grpc error info: \ncode: ${error?.code}     \nmessage: ${Uri.decodeComponent(error?.message)}',tag: '');
          LogUtil.e(error,tag: tag);
        }
      } else {
        msg = error;
        if(printDebugLog){
          LogUtil.e('Grpc error info:\nmessage:$msg',tag: '');
        }
      }
      if(printDebugLog){
        LogUtil.v('',tag: '//////////////////////处理异常响应-E//////////////////////////////\n');
      }
      return Future.error(msg);
    },test: (error) => true);
  }


  ///
  /// 处理Stream
  ///
  static Stream<T> grpcStreamIntercept<T>({@required String tag,@required Stream<T> responseStream,bool printDebugLog = true}){
    return responseStream
    .map((T t){
      if(printDebugLog){
        LogUtil.v('',tag: '\n////////////////////////正常处理响应-S///////////////////////////');
        LogUtil.v('\n\n${t.runtimeType}\n$t',tag: '[ GRPC ] Tag: < $tag >');
        LogUtil.v('',tag: '////////////////////////正常处理响应-E///////////////////////////\n');
      }
      return t;
    })
    .handleError((error){
      GRPCManager.instance.initClientChanel();
      if(printDebugLog){
        LogUtil.v('',tag: '\n////////////////////////处理异常响应-S///////////////////////////');
        LogUtil.v('\n\n',tag: '[ GRPC ] Tag: < $tag >');
      }
      var msg;
      if(error is GrpcError){
        msg = Uri.decodeComponent(error?.message);
        if(error.code == StatusCode.unauthenticated){
          if(msg.contains('token')){
            //AppManager().tokenExpiredBlock();
          }
        }
        if(printDebugLog){
          LogUtil.e('Grpc error info: \ncode: ${error?.code}     \nmessage: ${Uri.decodeComponent(error?.message)}',tag: '');
          LogUtil.e(error,tag: tag);
        }
      } else {
        msg = error;
        if(printDebugLog){
          LogUtil.e('Grpc error info:\nmessage:$msg',tag: '');
        }
      }
      if(printDebugLog){
        LogUtil.v('',tag: '//////////////////////处理异常响应-E//////////////////////////////\n');
      }
      return Future.error(msg);
    },test: (error) => true);
  }

  ///
  ///
  ///
  static Future<T> http<T extends BaseResponse>({@required String tag,@required HttpResponseFuture<T> response,bool printDebugLog = true}) async {
    var responseData;
    try{
      responseData = await response();
    } catch (error){
      if(printDebugLog){
        LogUtil.v('',tag: '\n////////////////////////处理异常响应-S///////////////////////////');
        LogUtil.v('\n\n${_simpleFormat(error.toString())}',tag: '[ Http ] Tag: < $tag >');
        LogUtil.v('',tag: '////////////////////////处理异常响应-E///////////////////////////\n');
      }
      return Future.error(error);
    }
    try{
      var code = responseData.errorCode;
      if(responseData?.errorCode != 1){
        String msg = responseData?.message ?? '';
        if(printDebugLog){
          LogUtil.v('',tag: '\n////////////////////////处理正常响应-S///////////////////////////');
          LogUtil.v('\n\nerrorCode:$code\t\tmessage:$msg',tag: '[ Http ] Tag: < $tag >');
          LogUtil.v('',tag: '////////////////////////处理正常响应-E///////////////////////////\n');
        }
        if(code == 12000){//authorizationFailure
          //AppManager().tokenExpiredBlock();
        }
      } else {
        if(printDebugLog){
          LogUtil.v('',tag: '\n////////////////////////处理正常响应-S///////////////////////////');
          LogUtil.v('\n\n${_simpleFormat(responseData.toString())}',tag: '[ Http ] Tag: < $tag >');
          LogUtil.v('',tag: '////////////////////////处理正常响应-E///////////////////////////\n');
        }
      }
    } catch(error){
      if(printDebugLog){
        LogUtil.v('',tag: '\n////////////////////////处理异常响应-S///////////////////////////');
        LogUtil.v('\n\n${_simpleFormat(error.toString())}',tag: '[ Http ] Tag: < $tag >');
        LogUtil.v('',tag: '////////////////////////处理异常响应-E///////////////////////////\n');
      }
      return Future.error(error);
    }
    return Future.value(responseData);
  }



  static Future<T> transfer<T,K>({@required Future<K> future,@required TransferFunction<T,K> transfer}) async{
    try{
      if(transfer == null || future == null){
        return null;
      } else {
        return Future.value(transfer(await future));
      }
    } catch (error){
      return Future.error(error);
    }
  }



  static void _printGrpcReqParams<K>(String tag,K params,bool printDebugLog){
    try{
      if(printDebugLog){
        LogUtil.v('',tag: '\n***************************请求参数-S/**************************');
        LogUtil.v('\n\n请求参数类型：${params.runtimeType}\n${params.toString()}',tag: '[ GRPC ] Tag: < $tag >');
        LogUtil.v('',tag: '***************************请求参数-E***************************\n');
      }
    } catch(_){}
  }

  ///
  ///
  ///
  ///
  static String _simpleFormat(String origin,{int step = 80}){
    StringBuffer sb = StringBuffer('');
    int len = origin.length;
    for(int i = 0; i < len;i += step){
      int s = i;
      int e = (i+step < len) ? i+step : len;
      sb.writeln(origin.substring(s,e));
    }
    return sb.toString();
  }



}

