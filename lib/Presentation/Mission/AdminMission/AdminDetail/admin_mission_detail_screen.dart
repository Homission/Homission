import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'admin_mission_detail_viewmodel.dart';
import 'package:homission/Presentation/Mission/AdminMission/ParticipantDetail/admin_participant_detail_screen.dart';
import 'package:homission/Presentation/Mission/AdminMission/Edit/mission_edit_screen.dart'; // Ensure you have the correct path

class AdminMissionDetailScreen extends StatefulWidget {
  const AdminMissionDetailScreen({super.key});

  @override
  _AdminMissionDetailScreenState createState() =>
      _AdminMissionDetailScreenState();
}

class _AdminMissionDetailScreenState extends State<AdminMissionDetailScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
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

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '미션을 삭제할까요',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(17, 17, 17, 1),
                              fontFamily: 'Pretendard',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '참여자 신청 등 미션 정보가 모두 삭제되며 삭제 후에는 되돌릴 수 없어요!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(56, 56, 56, 1),
                              fontFamily: 'Pretendard',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromRGBO(226, 226, 226, 1),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text(
                              '취소',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromRGBO(72, 156, 255, 1),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: GestureDetector(
                            onTap: () {
                              // Add delete logic here
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text(
                              '삭제',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminMissionDetailViewModel(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                // Navigate to the mission edit screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MissionEditScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: () {
                _showDeleteDialog();
              },
            ),
          ],
        ),
        body: Consumer<AdminMissionDetailViewModel>(
          builder: (context, viewModel, child) {
            return viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color.fromRGBO(208, 230, 255, 1),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildTabButton('미션 정보', 0),
                              const SizedBox(width: 4),
                              _buildTabButton('참여자', 1),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: _selectedIndex == 0
                            ? _buildMissionInfo(viewModel)
                            : _buildParticipantsInfo(),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected
              ? const Color.fromRGBO(255, 255, 255, 1)
              : const Color.fromRGBO(208, 230, 255, 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: isSelected
                ? const Color.fromRGBO(27, 27, 27, 1)
                : const Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Pretendard',
            fontSize: 13,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildMissionInfo(AdminMissionDetailViewModel viewModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(208, 230, 255, 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Text(
                    '활성화',
                    style: TextStyle(
                      color: Color.fromRGBO(72, 156, 255, 1),
                      fontFamily: 'Pretendard',
                      fontSize: 12,
                    ),
                  ),
                ),
                const Text(
                  '현재 888명 참여',
                  style: TextStyle(
                    color: Color.fromRGBO(135, 135, 135, 1),
                    fontFamily: 'Pretendard',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              '온라인 구직신청',
              style: TextStyle(
                color: Color.fromRGBO(17, 17, 17, 1),
                fontFamily: 'Pretendard',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(208, 230, 255, 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(72, 156, 255, 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '완료율 70%',
                  style: TextStyle(
                    color: Color.fromRGBO(72, 156, 255, 1),
                    fontFamily: 'Pretendard',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    SvgPicture.asset(
                      'asset_mission/image_mission/material-symbols_rewarded-ads-outline.svg',
                      width: 20,
                      height: 20,
                      color: const Color.fromRGBO(92, 92, 92, 1),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '보상',
                      style: TextStyle(
                        color: Color.fromRGBO(92, 92, 92, 1),
                        fontFamily: 'Pretendard',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Text(
                  '5,000P',
                  style: TextStyle(
                    color: Color.fromRGBO(92, 92, 92, 1),
                    fontFamily: 'Pretendard',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    SvgPicture.asset(
                      'asset_mission/image_mission/material-symbols_category-outline-rounded.svg',
                      width: 20,
                      height: 20,
                      color: const Color.fromRGBO(92, 92, 92, 1),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '카테고리',
                      style: TextStyle(
                        color: Color.fromRGBO(92, 92, 92, 1),
                        fontFamily: 'Pretendard',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Text(
                  '구직',
                  style: TextStyle(
                    color: Color.fromRGBO(92, 92, 92, 1),
                    fontFamily: 'Pretendard',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              height: 8,
              color: const Color.fromRGBO(245, 245, 245, 1),
            ),
            const SizedBox(height: 24),
            const Text(
              '첫번째, 서울노숙인일자리지원센터(서울노숙인일자리지원센터)에 방문해주세요!\n두번째, ‘온라인 구직신청’을 완료해주세요.\n세번째, 신청 완료된 화면을 캡쳐하여 호미션에 업로드해주시면 돼요!',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(17, 17, 17, 1),
                fontFamily: 'Pretendard',
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildParticipantsInfo() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: const Color.fromRGBO(18, 18, 18, 1),
            unselectedLabelColor: const Color.fromRGBO(227, 227, 227, 1),
            labelStyle: const TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            tabs: const [
              Tab(text: '승인필요'),
              Tab(text: '진행중'),
              Tab(text: '완료'),
            ],
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                ),
              ),
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildMissionList(isApprovalNeeded: true),
              _buildMissionList(),
              _buildMissionList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMissionList({bool isApprovalNeeded = false}) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10, // Replace with the actual number of missions
      itemBuilder: (context, index) {
        return _buildMissionItem(index, isApprovalNeeded);
      },
    );
  }

  Widget _buildMissionItem(int index, bool isApprovalNeeded) {
    // For demonstration, using dummy data
    final String title = '미션 제목 $index';
    const int rewardPoints = 5000;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            // Navigate to participant detail page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AdminParticipantDetailScreen(participantId: index),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: isApprovalNeeded
                  ? const Color.fromRGBO(73, 156, 255, 1)
                  : const Color.fromRGBO(245, 245, 245, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  title: Text(
                    title,
                    style: TextStyle(
                      color: isApprovalNeeded
                          ? Colors.white
                          : const Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  trailing: Container(
                    width: 85,
                    height: 23,
                    decoration: BoxDecoration(
                      color: isApprovalNeeded
                          ? Colors.white
                          : const Color.fromRGBO(73, 156, 255, 1),
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
                            color: isApprovalNeeded
                                ? const Color.fromRGBO(73, 156, 255, 1)
                                : Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${rewardPoints}P',
                            style: TextStyle(
                              color: isApprovalNeeded
                                  ? const Color.fromRGBO(73, 156, 255, 1)
                                  : Colors.white,
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
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
