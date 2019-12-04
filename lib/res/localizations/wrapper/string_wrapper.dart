import 'package:flutter/material.dart';

///动态function
typedef SwFunc = String Function(BuildContext context);

///
class StringWrapper{
  SwFunc initFun;

  StringWrapper(this.initFun);

  String get(BuildContext context){
    return initFun(context);
  }

  void set(SwFunc func){
    this.initFun = func;
  }


}

///转换工具
class StringWrapperUtil{
  static List<StringWrapper> toListStringWrapper(List<String> list){
    List<StringWrapper> sws = [];
    list.forEach((element){
      sws.add(StringWrapper((context)=>element));
    });
    return sws;
  }

  static List<String> toListString(BuildContext context,List<StringWrapper> list){
    List<String> s = [];
    list.forEach((element){
      s.add(element.get(context));
    });
    return s;
  }

  static StringWrapper toStringWrapper(String str){
    return StringWrapper((context) => str);
  }

  static String toStr(BuildContext context, StringWrapper sw){
    return sw.get(context);
  }
}


///情景1：
//class Ex{
//
//  BuildContext context;
//  Ex(this.context);
//
//  StringWrapper sw = StringWrapper((BuildContext context){
//  return MyLocalizations.of(context).home;
//  });
//
//  update(){
//    sw.set((BuildContext context){
//      return MyLocalizations.of(context).home;
//    });
//  }
//
//  log(){
//    print(sw.get(context));
//  }
//
//}


///情景2：
//abstract class MainState extends State<MainPage> {
//  ///成员变量字符串
//  StringWrapper home = StringWrapper((BuildContext context){
//    return MyLocalizations.of(context).home;
//  });
//
//  ///成员变量字符数组
//  List<StringWrapper> tabTitleList = [
//    StringWrapper((BuildContext context){
//      return MyLocalizations.of(context).home;
//    }),
//    StringWrapper((BuildContext context){
//      return MyLocalizations.of(context).team;
//    }),
//    StringWrapper((BuildContext context){
//      return MyLocalizations.of(context).asset;
//    }),
//    StringWrapper((BuildContext context){
//      return MyLocalizations.of(context).mime;
//    }),
//  ];
//
//  ///成员变量字符数组
//  Map<String,StringWrapper> map = {
//    "1":
//    StringWrapper((BuildContext context){
//      return MyLocalizations.of(context).home;
//    }),
//    "2":
//    StringWrapper((BuildContext context){
//      return MyLocalizations.of(context).team;
//    }),
//    "3":
//    StringWrapper((BuildContext context){
//      return MyLocalizations.of(context).asset;
//    }),
//  };
//
//}


///情景3：
//class TradeConstants {
//
//  //trade mode
//  static  StringWrapper limitPrice = StringWrapper((context) => '${MyLocalizations.of(context).limitPrice}');
//  static  StringWrapper marketPrice = StringWrapper((context) => '${MyLocalizations.of(context).marketPrice1}');
//  static  StringWrapper stopPrice = StringWrapper((context) => '${MyLocalizations.of(context).stopGainStopLoss}');
//
//  static  List<StringWrapper> tradeMenus = [
//    TradeConstants.limitPrice,
//    TradeConstants.marketPrice,
//    TradeConstants.stopPrice
//  ];
//}


///情景4:构造函数，带默认值的参数国际化
//class ClassicIndicator extends Indicator {
//  StringWrapper releaseText,idleText;
//
//  final TextStyle textStyle;
//
//  ClassicIndicator({
//    @required int mode,
//    Key key,
//    this.textStyle: const TextStyle(color: const Color(0xff555555)),
//    this.releaseText /*= MyLocalizations.of(context).releaseRefresh*/,
//    this.idleText /*=MyLocalizations.of(context).pullDown2Refresh*/,
//  }) {
//    if(releaseText == null){
//      releaseText = StringWrapper((BuildContext context){
//        return MyLocalizations.of(context).releaseRefresh;
//      });
//    }
//    if(idleText == null){
//      idleText = StringWrapper((BuildContext context){
//        return MyLocalizations.of(context).pullDown2Refresh;
//      });
//    }
//  }
//}
