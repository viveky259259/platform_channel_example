import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FlutterFromAndroid {
  String channelName = 'androidToFlutter';
  MethodChannel methodChannel;
  final Function(BuildContext context, String name) showProgress;
  final BuildContext context;

  FlutterFromAndroid(this.showProgress, this.context) {
    methodChannel = MethodChannel(channelName);
    methodChannel.setMethodCallHandler((MethodCall call) {
      switch (call.method) {
        case 'publish':
          print('publishing started:: Name: ${call.arguments}');
          showProgress(context, call.arguments);
          return;
        default:
          return;
      }
    });
  }
}
