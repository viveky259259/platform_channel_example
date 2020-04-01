import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flutter_from_android.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MethodChannelImplementation(),
    );
  }
}

class MethodChannelImplementation extends StatefulWidget {
  @override
  _MethodChannelImplementationState createState() =>
      _MethodChannelImplementationState();
}

class _MethodChannelImplementationState
    extends State<MethodChannelImplementation> {
  //Aim : we will call method channel and we will return 'Viveky259'
  String methodChannelValue;

  //Aim:2 Data pass throgh flutter => Android, Android==> FLutter,
  // Stream open both platform
  // iOS try

  static const methodChannel = MethodChannel('username');

  @override
  void initState() {
    super.initState();
    methodChannelValue = 'Not initiated';
  }

  void initMethodChannel() async {
    String returnedValue =
        await methodChannel.invokeMethod<String>('getUserName');
    if (returnedValue != null)
      setState(() {
        methodChannelValue = returnedValue;
      });
  }

  showProgress(BuildContext context, String name) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text('publishing'),
              title: Text('Name: $name'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    FlutterFromAndroid(showProgress, context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Method channel'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            methodChannelValue,
            style: Theme.of(context).textTheme.title,
          ),
          RaisedButton(
            onPressed: initMethodChannel,
            child: Text("Initiate Method channel"),
          )
        ],
      ),
    );
  }
}
