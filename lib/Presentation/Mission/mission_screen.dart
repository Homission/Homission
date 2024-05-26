import 'package:flutter/material.dart';
import 'package:homission/Presentation/Mission/in_progress_screen.dart';
import 'completed_screen.dart';
import 'browse_screen.dart';
import 'custom_app_bar.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  _MissionScreenState createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배지 제거
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft, // 탭을 왼쪽 정렬
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor:
                    const Color.fromRGBO(18, 18, 18, 1), // 선택된 탭의 텍스트 색상
                unselectedLabelColor:
                    const Color.fromRGBO(227, 227, 227, 1), // 선택되지 않은 탭의 텍스트 색상
                labelStyle: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ), // 선택된 탭의 텍스트 스타일
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ), // 선택되지 않은 탭의 텍스트 스타일
                tabs: const [
                  Tab(text: '진행중'),
                  Tab(text: '완료'),
                  Tab(text: '둘러보기'),
                ],
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2.0, // 인디케이터 라인 두께 설정
                    ),
                  ),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                dividerColor: Colors.transparent, // 탭바 라인 투명
                tabAlignment: TabAlignment.start, // 추가된 속성
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  InProgressScreen(),
                  CompletedScreen(),
                  const BrowseScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
