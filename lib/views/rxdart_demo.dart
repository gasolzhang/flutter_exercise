import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RxState();
  }
}

class RxState extends State<RxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxDart示例')),
      body: Container(
          child: Column(
        children: <Widget>[
          RaisedButton(child: Text('PublishSubject示例'), onPressed: () => simpleExample()),
          RaisedButton(child: Text('BehaviorSubject示例'), onPressed: () => simpleExample2()),
          RaisedButton(child: Text('ReplaySubject示例'), onPressed: () => simpleExample3()),
        ],
      )),
    );
  }
/**
 * 普通广播流控制器：PublishSubject
    PublishSubject就是一个普通广播版StreamController，
    你可以多次收听，默认是sync是false，也就是说里面是一个AsyncBroadcastStreamController 异步广播流。
 * */
  ///
  void simpleExample() {
    //先监听才能收到通知，属于典型的StreamController
    PublishSubject ps = PublishSubject<String>();
    ps.map((value)=> 'PS--$value');
    ps.listen((data) => print('listen1=$data'));
    ps.add('event1');
    ps.add('event2');
    ps.close();
  }

  /**
   * 缓存最新一次事件的广播流控制器：BehaviorSubject
      BehaviorSubject也是一个广播流，但是它能记录下最新一次的事件，并在新的收听者收听的时候将记录下的事件作为第一帧发送给收听者。
   * */
  ///
  void simpleExample2() {

    BehaviorSubject bj = BehaviorSubject<String>();
    bj.listen((value) => print('listen1=$value'));
    bj.add('event1');
    //最后一次添加的数据会再重发一次，添加之前的监听才能收到，之后的监听收不到
    bj.add('event2');
    bj.listen((value) => print('listen2=$value'));
//    bj.listen((value) => print('listen3=$value'));
//    bj.add('event3');
    bj.close();
  }

  /**
   * 缓存更多事件的广播流控制器：ReplaySubject
      ReplaySubject能够缓存更多的值，默认情况下将会缓存所有值，并在新的收听的时候将记录下的事件作为第一帧发送给收听者。
   * */
  ///
  void simpleExample3() {
    //全部数据重发，maxSize:2表示只重发最近的2条数据
    ReplaySubject rs = ReplaySubject<String>(maxSize: 2); //设置最大重发数量
    rs.add('event1');
    rs.add('event2');
    rs.add('event3');
    rs.listen((value) => print('listen1=$value'));
    rs.listen((value) => print('listen2=$value'));
    rs.close();
  }
}
