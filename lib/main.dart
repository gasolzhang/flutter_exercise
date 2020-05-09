import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_webview/router/my_router.dart';
import 'package:flutter_webview/theme_model.dart';
import 'package:provider/provider.dart';
import 'generated/i18n.dart';

void main() =>
    runApp(ChangeNotifierProvider.value(
        value: ThemeModel(ThemeMode.light), child: ColorFiltered(colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.color),child: MyApp())));
  ///ColorFilter 全局置灰***
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //全屏/隐藏状态栏
//    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return MaterialApp(
      themeMode: Provider.of<ThemeModel>(context).themeMode,
      debugShowCheckedModeBanner: true,
      localizationsDelegates: [
        S.delegate,
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('zh', 'CH'), // Hebrew
        // ... other locales the app supports
      ],
      title: '豆瓣APP',
      theme: ThemeData(
        //亮色风格/暗色风格
          brightness: Brightness.light,
        //一些组件如果没有指定颜色，则会使用这些颜色
          primaryColor: Colors.green,
          primarySwatch: Colors.purple,//未主题色时，有些组件会使用此颜色为默认颜色
          accentColor: Colors.amber,
//        highlightColor: Colors.transparent,//去除点击水波纹效果
//        splashColor: Colors.transparent,
//        splashFactory: InkRipple.splashFactory,
//        scaffoldBackgroundColor: Colors.blue,
//        unselectedWidgetColor: Colors.white,
          disabledColor: Colors.grey[200],
          textSelectionColor: Colors.green,
          cursorColor: Colors.redAccent,
//        backgroundColor: Colors.purple,// 与主色形成对比的颜色，例如用作进度条的剩余部分。
          dialogBackgroundColor: Colors.white,
          indicatorColor: Colors.blue,//tab的indicatorColor的color
          hintColor: Colors.grey[200],
          errorColor: Colors.red,
          toggleableActiveColor: Colors.greenAccent,//checkbox，radio选中颜色
//        fontFamily: TextStyle.primaryTextTheme,
          buttonTheme: ButtonThemeData(buttonColor: Colors.green),
//      inputDecorationTheme: InputDecorationTheme(),//统一设置输入框样式
//      iconTheme: IconThemeData(color: Colors.indigoAccent,size: 30,opacity: 0.5),//统一设置icon样式
      cardTheme: CardTheme(shape: RoundedRectangleBorder()),
//      tabBarTheme: TabBarTheme(),
//      pageTransitionsTheme:PageTransitionsTheme(),
      appBarTheme: AppBarTheme(),
//      colorScheme: ColorScheme(),
//      dialogTheme: DialogTheme(),
      //统一自定义card样式
      dividerTheme: DividerThemeData(
          color: Colors.grey[200], thickness: 1), //统一已定义分隔线样式
//          highlightColor: Colors.transparent,///点击态颜色
//          splashColor: Colors.transparent
    ),
//      home: SplashPage(),
    initialRoute: '/mystack',
    //启动页路由
    routes: getRouters(),
    );
  }
}

