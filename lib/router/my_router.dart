import 'package:flutter/cupertino.dart';
import 'package:flutter_webview/views/amap_page.dart';
import 'package:flutter_webview/views/animated_builder_page.dart';
import 'package:flutter_webview/views/animation_list_page.dart';
import 'package:flutter_webview/views/animation_page.dart';
import 'package:flutter_webview/views/animation_widget_page.dart';
import 'package:flutter_webview/views/app_lifecycle_page.dart';
import 'package:flutter_webview/views/beauty_pager_demo.dart';
import 'package:flutter_webview/views/blur_page.dart';
import 'package:flutter_webview/views/button/button_demo.dart';
import 'package:flutter_webview/views/card_page.dart';
import 'package:flutter_webview/views/check_box_demo.dart';
import 'package:flutter_webview/views/column_demo.dart';
import 'package:flutter_webview/views/customscrollview_page.dart';
import 'package:flutter_webview/views/date_time_demo.dart';
import 'package:flutter_webview/views/decoration_box_transition.dart';
import 'package:flutter_webview/views/dialog_demo.dart';
import 'package:flutter_webview/views/expansion_tile_page.dart';
import 'package:flutter_webview/views/flutter_sound_demo.dart';
import 'package:flutter_webview/views/hero1_page.dart';
import 'package:flutter_webview/views/hero2_page.dart';
import 'package:flutter_webview/views/html_demo.dart';
import 'package:flutter_webview/views/ikjplayer_page.dart';
import 'package:flutter_webview/views/imge_picker_page.dart';
import 'package:flutter_webview/views/isolate_demo_page.dart';
import 'package:flutter_webview/views/launch_url_page.dart';
import 'package:flutter_webview/views/local_auth.dart';
import 'package:flutter_webview/views/paint_page.dart';
import 'package:flutter_webview/views/progress_demo.dart';
import 'package:flutter_webview/views/radio_demo.dart';
import 'package:flutter_webview/views/refresh_demo.dart';
import 'package:flutter_webview/views/rxdart_demo.dart';
import 'package:flutter_webview/views/scan_page.dart';
import 'package:flutter_webview/views/share_preference_page.dart';
import 'package:flutter_webview/views/sliver_demo_page.dart';
import 'package:flutter_webview/views/splash/splash_page.dart';
import 'package:flutter_webview/views/staggered_page.dart';
import 'package:flutter_webview/views/swiper_demo.dart';
import 'package:flutter_webview/views/switch_demo.dart';
import 'package:flutter_webview/views/take_picture_page.dart';
import 'package:flutter_webview/views/textfiled/text_filed_demo.dart';
import 'package:flutter_webview/views/toast_demo.dart';
import 'package:flutter_webview/views/video_player_page.dart';
import '../home_page.dart';
import '../webview_page.dart';

///路由统一配置
Map<String, WidgetBuilder> getRouters() {
  return {
    '/splash': (context) => SplashPage(),
    '/mystack': (context) => HomePage(),
    '/button': (context) => ButtonPage(),
    '/textfield': (context) => TextFieldPage(),
    '/checkbox': (context) => CheckBoxPage(),
    '/radio': (context) => RadioPage(),
    '/switch': (context) => SwitchPage(),
    '/datetime': (context) => DateTimePage(),
    '/swiper': (context) => SwiperPage(),
    '/dialog': (context) => DialogPage(),
    '/toast': (context) => ToastPage(),
    '/progress': (context) => Progresspage(),
    '/refresh': (context) => RefreshPage(),
    '/html': (context) => NewsContentPage(),
    '/webview': (context) => WebViewPage(),
    '/location': (context) => AmapPage(),
    '/imagepicker': (context) => ImagePickerPage(),
    '/videoplayer': (context) => VideoPlayerPage(),
    '/share_preference': (context) => SharedPrePage(),
    '/scan': (context) => ScanPage(),
    '/launch': (context) => LaunchUrlPage(),
    '/rxdart': (context) => RxPage(),
    '/column': (context) => ColumnPage(),
    '/take_picture': (context) => TakePicturePage(),
    '/pre_picture': (context) => PrePicturePage(),
    '/ijkplayer': (context) => IjkPlayerPage(),
    '/auth_page': (context) => AuthPage(),
    '/card': (context) => CardPage(),
    '/animation': (context) => AnimationPage(),
    '/animation_list': (context) => AnimatedListPage(),
    '/hero1': (context) => Hero1Page(),
    '/hero2': (context) => Hero2Page(),
    '/animation_widget_page': (context) => AnimatedWidgetPage(),
    '/animation_builder_page': (context) => AnimatedBuildPage(),
    '/box_transition_page': (context) => BoxTransitionPage(),
    '/paint_page': (context) => PaintDemoPage(),
    '/expansion_tile': (context) => ExpansionTilePage(),
    '/sliver': (context) => SliverDemoPage(),
    '/pager': (context) => BeatyPagerPage(),
    '/isolate': (context) => IsolatePage(),
    '/staggerd': (context) => StaggerdPage(),
    '/sound': (context) => SoundPage(),
    '/lifecycle': (context) => AppLifecyclePage(),
    '/blur': (context) => BlurPage(),
    '/custom_scroll': (context) => CustomScrollViewPage(),
  };
}
