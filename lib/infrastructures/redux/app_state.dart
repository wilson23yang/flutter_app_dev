

///全局Redux store 的对象，保存State数据
class AppState {


  ///是否黑色主题
  final bool isDarkTheme;


  ///是否正在加载
  final bool isLoading;




  AppState({
    this.isDarkTheme = false,
    this.isLoading = false,
  });

  // 持久化时，从 JSON 中初始化新的状态
  static AppState fromJson(dynamic json){
    print("json:::::::::::$json");
    return AppState(
      isDarkTheme: false,
      isLoading: false,
    );
  }

  // 更新状态之后，转成 JSON，然后持久化至持久化引擎中
  dynamic toJson() => {
        'isDarkTheme': isDarkTheme,
      };
}
