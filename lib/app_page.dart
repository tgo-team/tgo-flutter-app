import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tgo_flutter_sdk/common/application.dart';

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppPageState();
  }
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TGO'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Application.navigateTo(context, "/session_list");
              },
              child: Text('跳到会话列表'),
            )
          ],
        ),
      ),
    );
  }
}
