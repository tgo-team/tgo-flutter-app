import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tgo_flutter_app/app_page.dart';
import 'package:tgo_flutter_app/routes/routers.dart';
import 'package:tgo_flutter_sdk/module/module.dart';
import 'package:tgo_flutter_session/tgo_flutter_session.dart';
import 'package:tgo_flutter_sdk/common/application.dart';

void main(){
  TGO.addModule(SessionModule());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TGO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  AppPage(),
    );
  }
}


