import 'dart:io';

import 'package:deviceinfoapp/provider/device_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeviceInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceData = Provider.of<DeviseDetails>(context).deviceData;
    print('hi');
    return Scaffold(
      body: SafeArea(
        child: deviceData != null
            ? ListView.builder(
                itemCount: deviceData.length,
                itemBuilder: (context, i) {
                  List a = deviceData.keys.toList();
                  List b = deviceData.values.toList();
                  return Container(
                    child: Text('${a[i]} : ${b[i].toString()}'),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
