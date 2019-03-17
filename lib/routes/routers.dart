import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tgo_flutter_sdk/module/module.dart';

class Routes {
  static String root = "/";
  static String sessionList = "/session_list"; // 会话列表

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc:
            (BuildContext context, Map<String, List<String>> params) {});
    List<Module> modules = TGO.getAllModule();
    if (modules != null && modules.length > 0) {
      for (Module module in modules) {
        router.define(module.path,
            handler: Handler(
              handlerFunc: (BuildContext context,Map<String,List<String>> params){
                 return defaultScaffold(module.getWidget(context,params),title: module.title);
              },
            ));
      }
    }
  }
}

Scaffold defaultScaffold(Widget body, {String title}) {
  return Scaffold(
    appBar: AppBar(title: Text(title??""),),
    body: body,
  );
}