import 'dart:async';
import 'dart:io';

import 'package:deviceinfoapp/provider/device_details.dart';
import 'package:deviceinfoapp/screen/device_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runZoned(() {
    runApp(MyApp());
  }, onError: (dynamic error, dynamic stack) {
    print(error);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeviseDetails(Platform.operatingSystem),
      child: MaterialApp(
        title: 'Device info',
        home: DeviceInfo(),
      ),
    );
  }
}
