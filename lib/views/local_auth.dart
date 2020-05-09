import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class AuthPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<AuthPage> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      //1.检查是否可以生物识别
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      //2.获取可用的生物识别(实际只有指纹识别)
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      //3.执行生物识别识别(实际就是执行指纹识别)
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          androidAuthStrings: AndroidAuthMessages(
            cancelButton: '取消',
            goToSettingsButton: '去设置',
            fingerprintNotRecognized: '指纹识别失败',
            goToSettingsDescription: '请设置指纹',
            fingerprintHint: '指纹',
            signInTitle: '指纹验证',
            fingerprintRequiredTitle: '请先录入指纹'
          ));
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Can check biometrics: $_canCheckBiometrics\n'),
                RaisedButton(
                  child: const Text('Check biometrics'),
                  onPressed: _checkBiometrics,
                ),
                Text('Available biometrics: $_availableBiometrics\n'),
                RaisedButton(
                  child: const Text('Get available biometrics'),
                  onPressed: _getAvailableBiometrics,
                ),
                Text('Current State: $_authorized\n'),
                RaisedButton(
                  child: Text(_isAuthenticating ? 'Cancel' : 'Authenticate'),
                  onPressed:
                      _isAuthenticating ? _cancelAuthentication : _authenticate,
                )
              ])),
    ));
  }
}
