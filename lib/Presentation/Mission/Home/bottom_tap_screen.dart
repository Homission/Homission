import 'package:flutter/material.dart';
import 'package:homission/Presentation/Mission/Home/home_screen.dart';
import 'package:homission/Presentation/Mission/mission_screen.dart';
import 'package:homission/Gifticon/MarketPage.dart';
import 'package:homission/Presentation/Profile/myPage.dart';

class BottomTapScreen extends StatefulWidget {
  const BottomTapScreen({Key? key}) : super(key: key);

  @override
  State<BottomTapScreen> createState() => _BottomTapScreenState();
}

class _BottomTapScreenState extends State<BottomTapScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold
  );

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MissionScreen(),
    MarketPage(),
    myPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 메인 위젯
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/bottomtap/home.png'),
              size: 24,
            ),
            label: '우리집',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/bottomtap/mission.png'),
              size: 24,
            ),
            label: '미션',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/bottomtap/market.png'),
              size: 24,
            ),
            label: '마켓',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/bottomtap/mypage.png'),
              size: 24,
            ),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        selectedIconTheme: IconThemeData(size: 24),
        unselectedIconTheme: IconThemeData(size: 24),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}