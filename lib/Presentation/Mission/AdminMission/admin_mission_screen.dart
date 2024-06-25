import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'admin_mission_screen_viewmodel.dart';
import 'AdminDetail/admin_mission_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminMissionViewModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AdminMissionScreen(),
      ),
    );
  }
}

class AdminMissionScreen extends StatefulWidget {
  const AdminMissionScreen({super.key});

  @override
  _AdminMissionScreenState createState() => _AdminMissionScreenState();
}

class _AdminMissionScreenState extends State<AdminMissionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    Provider.of<AdminMissionViewModel>(context, listen: false).fetchAdminData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminMissionViewModel>(
      builder: (context, adminViewModel, child) {
        return Scaffold(
          appBar: const AdminAppBar(),
          body: adminViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  '관리자',
                                  style: TextStyle(
                                    color: Color.fromRGBO(17, 17, 17, 1),
                                    fontFamily: 'Pretendard',
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  '님',
                                  style: TextStyle(
                                    color: Color.fromRGBO(17, 17, 17, 1),
                                    fontFamily: 'Pretendard',
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              '안녕하세요!',
                              style: TextStyle(
                                color: Color.fromRGBO(17, 17, 17, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          _buildButton('내 센터', adminViewModel.centerName),
                          const SizedBox(width: 8),
                          _buildButton('승인 필요 미션',
                              '${adminViewModel.approvalNeededMissions}개'),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black,
                        indicator: const BoxDecoration(),
                        labelStyle: const TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        tabs: [
                          for (var i = 0; i < 5; i++)
                            Tab(
                              child: Container(
                                height: 30,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                margin: const EdgeInsets.only(right: 8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: _tabController.index == i
                                        ? const Color.fromRGBO(18, 18, 18, 1)
                                        : const Color.fromRGBO(
                                            227, 227, 227, 1),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  color: _tabController.index == i
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (i == 1)
                                        Icon(
                                          Icons.health_and_safety,
                                          size: 16,
                                          color: _tabController.index == i
                                              ? Colors.black
                                              : const Color.fromRGBO(
                                                  227, 227, 227, 1),
                                        ),
                                      if (i == 2)
                                        Icon(
                                          Icons.work,
                                          size: 16,
                                          color: _tabController.index == i
                                              ? Colors.black
                                              : const Color.fromRGBO(
                                                  227, 227, 227, 1),
                                        ),
                                      if (i == 3)
                                        Icon(
                                          Icons.favorite,
                                          size: 16,
                                          color: _tabController.index == i
                                              ? Colors.black
                                              : const Color.fromRGBO(
                                                  227, 227, 227, 1),
                                        ),
                                      if (i == 4)
                                        Icon(
                                          Icons.school,
                                          size: 16,
                                          color: _tabController.index == i
                                              ? Colors.black
                                              : const Color.fromRGBO(
                                                  227, 227, 227, 1),
                                        ),
                                      const SizedBox(width: 4),
                                      Text(
                                        ['전체', '건강', '구직', '마음', '교육'][i],
                                        style: TextStyle(
                                          color: _tabController.index == i
                                              ? Colors.black
                                              : const Color.fromRGBO(
                                                  227, 227, 227, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        tabAlignment: TabAlignment.start,
                        dividerColor: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildMissionList(),
                          _buildMissionList(),
                          _buildMissionList(),
                          _buildMissionList(),
                          _buildMissionList(),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildButton(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            offset: Offset(0, 2),
            blurRadius: 16,
          ),
        ],
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color.fromRGBO(190, 190, 190, 1),
              fontFamily: 'Pretendard',
              fontSize: 11,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color.fromRGBO(72, 156, 255, 1),
                  fontFamily: 'Pretendard',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 4),
              SvgPicture.asset(
                'assets/images/vector.svg',
                width: 16,
                height: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMissionList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10, // Replace with the actual number of missions
      itemBuilder: (context, index) {
        return _buildMissionItem();
      },
    );
  }

  Widget _buildMissionItem() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminMissionDetailScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 245, 245, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 85,
                      height: 23,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(73, 156, 255, 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'asset_mission/image_mission/material-symbols_rewarded-ads-outline.svg',
                              width: 16,
                              height: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '5000P',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'asset_mission/image_mission/material-symbols_group-outline-rounded.svg',
                          width: 16,
                          height: 16,
                          color: const Color.fromRGBO(136, 136, 136, 1),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '120명',
                          style: TextStyle(
                            color: Color.fromRGBO(136, 136, 136, 1),
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        '미션 제목',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '미션 설명입니다. 이 설명은 미션에 대한 간략한 정보를 제공합니다.',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                        ),
                        maxLines: null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AdminAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 96,
          height: 28,
          child: Image.asset(
            'asset_mission/image_mission/mission_logo.png', // 로고 이미지 경로 설정
            fit: BoxFit.fitWidth, // 가로 너비에 맞추고 세로 비율 유지
          ),
        ),
      ),
      leadingWidth: 96,
    );
  }
}
