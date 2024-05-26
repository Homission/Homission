import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isChecked = false;
  int? _selectedIndex;
  String _selectedSortOption = '인기순';
  bool _isSortOptionsVisible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<String> missions = [
    '온라인 구직신청',
    '미션 2',
    '미션 3',
    '미션 4',
    '미션 5',
  ];

  final List<int> rewardPoints = [
    100,
    200,
    300,
    400,
    500,
  ];

  final List<String> missionDescriptions = [
    '첫번째, 서울노숙인일자리지원센터(서울노숙인일자리지원센터)에 방문해주세요! 두번째, ‘온라인 구직신청’을 완료해주세요. 세번째, 신청 완료된 화면을 캡쳐하여 호미션에 업로드해주시면 돼요!',
    '이것은 미션 2에 대한 설명입니다.',
    '이것은 미션 3에 대한 설명입니다.',
    '이것은 미션 4에 대한 설명입니다.',
    '이것은 미션 5에 대한 설명입니다.',
  ];

  final List<String> participants = [
    '1,201명',
    '2,345명',
    '567명',
    '3,789명',
    '1,234명',
  ];

  void _toggleSortOptions() {
    setState(() {
      _isSortOptionsVisible = !_isSortOptionsVisible;
    });
  }

  void _selectSortOption(String option) {
    setState(() {
      _selectedSortOption = option;
      _isSortOptionsVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 5,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 8.0), // 전체 탭바를 왼쪽으로 정렬
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(), // 인디케이터를 완전히 제거
                  labelStyle: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        margin: EdgeInsets.only(right: 8.0), // 버튼 간의 간격 설정
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _tabController.index == 0
                                ? Color.fromRGBO(18, 18, 18, 1)
                                : Color.fromRGBO(227, 227, 227, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: _tabController.index == 0
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            '전체',
                            style: TextStyle(
                              color: _tabController.index == 0
                                  ? Colors.black
                                  : Color.fromRGBO(227, 227, 227, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        margin: EdgeInsets.only(right: 8.0), // 버튼 간의 간격 설정
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _tabController.index == 1
                                ? Color.fromRGBO(18, 18, 18, 1)
                                : Color.fromRGBO(227, 227, 227, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: _tabController.index == 1
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.health_and_safety,
                              size: 16,
                              color: _tabController.index == 1
                                  ? Colors.black
                                  : Color.fromRGBO(227, 227, 227, 1),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '건강',
                              style: TextStyle(
                                color: _tabController.index == 1
                                    ? Colors.black
                                    : Color.fromRGBO(227, 227, 227, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        margin: EdgeInsets.only(right: 8.0), // 버튼 간의 간격 설정
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _tabController.index == 2
                                ? Color.fromRGBO(18, 18, 18, 1)
                                : Color.fromRGBO(227, 227, 227, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: _tabController.index == 2
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.work,
                              size: 16,
                              color: _tabController.index == 2
                                  ? Colors.black
                                  : Color.fromRGBO(227, 227, 227, 1),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '구직',
                              style: TextStyle(
                                color: _tabController.index == 2
                                    ? Colors.black
                                    : Color.fromRGBO(227, 227, 227, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        margin: EdgeInsets.only(right: 8.0), // 버튼 간의 간격 설정
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _tabController.index == 3
                                ? Color.fromRGBO(18, 18, 18, 1)
                                : Color.fromRGBO(227, 227, 227, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: _tabController.index == 3
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 16,
                              color: _tabController.index == 3
                                  ? Colors.black
                                  : Color.fromRGBO(227, 227, 227, 1),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '마음',
                              style: TextStyle(
                                color: _tabController.index == 3
                                    ? Colors.black
                                    : Color.fromRGBO(227, 227, 227, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        margin: EdgeInsets.only(right: 8.0), // 버튼 간의 간격 설정
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _tabController.index == 4
                                ? Color.fromRGBO(18, 18, 18, 1)
                                : Color.fromRGBO(227, 227, 227, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: _tabController.index == 4
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.school,
                              size: 16,
                              color: _tabController.index == 4
                                  ? Colors.black
                                  : Color.fromRGBO(227, 227, 227, 1),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '교육',
                              style: TextStyle(
                                color: _tabController.index == 4
                                    ? Colors.black
                                    : Color.fromRGBO(227, 227, 227, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                ),
              ),
              Container(
                height: 54,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isChecked = !_isChecked;
                              });
                            },
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: _isChecked
                                    ? Colors.black
                                    : Color.fromRGBO(227, 227, 227, 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: _isChecked
                                  ? Icon(Icons.check,
                                      color: Colors.white, size: 18)
                                  : null,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '내 센터만 보기',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: _isChecked
                                  ? Colors.black
                                  : Color.fromRGBO(227, 227, 227, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _selectedSortOption,
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 4),
                          GestureDetector(
                            onTap: _toggleSortOptions,
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 22,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: missions.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedIndex == index;
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: index == 0 ? 16.0 : 10.0,
                        bottom: index == missions.length - 1 ? 16.0 : 0.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color.fromRGBO(73, 156, 255, 1)
                                  : Color.fromRGBO(245, 245, 245, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      width: 85,
                                      height: 23,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.white
                                            : Color.fromRGBO(73, 156, 255, 1),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              'asset_mission/image_mission/material-symbols_rewarded-ads-outline.svg',
                                              width: 16,
                                              height: 16,
                                              color: isSelected
                                                  ? Color.fromRGBO(
                                                      73, 156, 255, 1)
                                                  : Colors.white,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${rewardPoints[index]}P',
                                              style: TextStyle(
                                                color: isSelected
                                                    ? Color.fromRGBO(
                                                        73, 156, 255, 1)
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
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'asset_mission/image_mission/material-symbols_group-outline-rounded.svg',
                                          width: 16,
                                          height: 16,
                                          color: isSelected
                                              ? Colors.white
                                              : Color.fromRGBO(
                                                  136, 136, 136, 1),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          participants[index],
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : Color.fromRGBO(
                                                    136, 136, 136, 1),
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 40),
                                      Text(
                                        missions[index],
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : const Color.fromRGBO(
                                                  0, 0, 0, 1),
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 16), // 추가된 간격
                                      Text(
                                        missionDescriptions[index],
                                        style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color: isSelected
                                              ? Colors.white
                                              : const Color.fromRGBO(
                                                  0, 0, 0, 0.6),
                                        ),
                                        maxLines: null, // 줄바꿈 설정
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
                  },
                ),
              ),
            ],
          ),
        ),
        if (_isSortOptionsVisible)
          Positioned(
            left: 12,
            right: 12,
            bottom: 34,
            child: Material(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 64,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Color.fromRGBO(226, 226, 226, 1),
                      ),
                    ),
                    SizedBox(height: 12),
                    ListTile(
                      title: Text(
                        '인기순',
                        style: TextStyle(
                          color: _selectedSortOption == '인기순'
                              ? Colors.black
                              : Color.fromRGBO(190, 190, 190, 1),
                          fontFamily: 'Pretendard',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        _selectSortOption('인기순');
                      },
                    ),
                    ListTile(
                      title: Text(
                        '최신순',
                        style: TextStyle(
                          color: _selectedSortOption == '최신순'
                              ? Colors.black
                              : Color.fromRGBO(190, 190, 190, 1),
                          fontFamily: 'Pretendard',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        _selectSortOption('최신순');
                      },
                    ),
                    ListTile(
                      title: Text(
                        '오래된순',
                        style: TextStyle(
                          color: _selectedSortOption == '오래된순'
                              ? Colors.black
                              : Color.fromRGBO(190, 190, 190, 1),
                          fontFamily: 'Pretendard',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        _selectSortOption('오래된순');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
