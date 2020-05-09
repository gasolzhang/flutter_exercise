import 'package:amap_location/amap_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AmapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AmapState();
  }
}

class AmapState extends State<AmapPage> {
  @override
  void initState() {
    super.initState();
//    initLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('高德定位')),
        body: Container(
          child: Center(
              child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('异步获取定位'),
                onPressed: () {
                  getLocation();
                },
              )
            ],
          )),
        ));
  }

  void initLocation() async {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.location]);
    print(permissions.keys);
    print(permissions.values);

    bool result = permissions.values.every((value) {
      return value == PermissionStatus.granted;
    });

    if (result) {
      await AMapLocationClient.startup(AMapLocationOption(
          desiredAccuracy:
              CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    } else {
      print('授权拒绝');
    }
  }

  getLocation() async {
    AMapLocation loc = await AMapLocationClient.getLocation(true);
    print('amap.country=${loc.country}');
    print('amap.provider=${loc.provider}');
    print('amap.citycode=${loc.citycode}');
    print('amap.adcode=${loc.adcode}');
    print('amap.street=${loc.street}');
    print('amap.formattedAddress=${loc.formattedAddress}');
    print('amap.latitude=${loc.latitude}');
    print('amap.longtitude=${loc.longitude}');
  }

  void listenLocationUpdate() {
    AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
      if (!mounted) return;
      setState(() {
        print('amap.country=${loc.country}');
        print('amap.provider=${loc.provider}');
        print('amap.citycode=${loc.citycode}');
        print('amap.adcode=${loc.adcode}');
        print('amap.street=${loc.street}');
        print('amap.formattedAddress=${loc.formattedAddress}');
      });
    });

    AMapLocationClient.startLocation();
  }

  void stopLocation() {
    AMapLocationClient.stopLocation();
  }

  @override
  void dispose() {
    //注意这里关闭
    AMapLocationClient.shutdown();
    super.dispose();
  }
}
