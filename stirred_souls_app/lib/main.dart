import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stirred_souls_app/pages/FavoritePage.dart';
import 'package:stirred_souls_app/pages/HomePage.dart';
import 'package:stirred_souls_app/pages/JournalPage.dart';
import 'package:stirred_souls_app/pages/SettingPage.dart';
import 'widgets/stirred_bottom_nav.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    JournalPage(),
    FavoritePage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onAddPressed() {
    // 添加新调酒逻辑
    print('点击了加号按钮！');
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Column(
      children: [
        // 顶部 Safe 区域背景
        Container(
          height: padding.top,
          color: const Color(0xFFFFF0DF), // 你想要的上背景色
        ),
        // 内容区域
        MediaQuery.removePadding(
          context: context, 
          removeTop: true,
          removeBottom: true,
          child: Expanded(
            child: Scaffold(
              backgroundColor: const Color(0xFFFFF0DF), // 主内容背景色
              body: _pages[_currentIndex],
              bottomNavigationBar: StirredBottomNav(
                currentIndex: _currentIndex,
                onItemTapped: _onItemTapped,
              ),
              floatingActionButton: SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  onPressed: _onAddPressed,
                  backgroundColor: const Color(0xFFB4866E),
                  shape: const CircleBorder(),
                  elevation: 8,
                  child: const FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            ),
          ),
        ),
        // 底部 Safe 区域背景
        Container(
          height: padding.bottom,
          color: const Color(0xffffffff), // 你想要的下背景色
        ),
      ],
    );
  }
}

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(
    MaterialApp(
      home: MainPage() // 或你其他页面
    ),
  );
}
