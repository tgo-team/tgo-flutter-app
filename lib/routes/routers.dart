import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tgo_flutter_sdk/module/module.dart';

class Routes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc:
            (BuildContext context, Map<String, List<String>> params) {});
    List<Module> modules = TGO.getAllModule();
    if (modules != null && modules.length > 0) {
      for (Module module in modules) {
        List<Point> points = module.getAllPoint();
        for(Point point in points) {
          router.define(point.path,
              handler: Handler(
                handlerFunc: (BuildContext context,Map<String,List<String>> params){
                  return defaultScaffold(point.handler(context,params),title: point.title??"");
                },
              ));
        }
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