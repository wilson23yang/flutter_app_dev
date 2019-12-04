import "package:flutter/material.dart";

class PersistTabView extends StatefulWidget {
  final Widget child;

  PersistTabView({Key key, @required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PersistTabViewState();
  }
}

class _PersistTabViewState extends State<PersistTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
