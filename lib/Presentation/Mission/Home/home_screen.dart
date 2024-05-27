import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homission/Presentation/Mission/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool hasMissionInProgress = true; // 사용자가 수행 중인 미션이 있는지 여부
  final List<String> missions = [
    '희망의 인문학 수업 참여',
    // '심리상담 “마음세우기" 참여',
    // '[금주] 몸이 아플 때 센터의 도움 받기'
  ];

  final List<int> rewardPoints = [10000, 5000, 3000];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showToast(context);
    });
  }

  void _showToast(BuildContext context) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(72, 156, 255, 0.16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '집 완성까지 1단계 남았어요!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(27, 27, 27, 1),
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/vector.svg',
                    semanticsLabel: 'vector',
                    width: 16,
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(overlayEntry);

    Future.delayed(Duration(seconds: 4), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(
                      'asset_mission/image_mission/level1_home_first_img.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 24,
                    left: 24,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(72, 156, 255, 0.16),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '1번째 집',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Pretendard',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    right: 24,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(72, 156, 255, 0.16),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                              'asset_mission/image_mission/home_list_icon.svg',
                              width: 24,
                              height: 24,
                              color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (hasMissionInProgress)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Text(
                      '지금 수행 중인 호미션',
                      style: TextStyle(
                        color: Color.fromRGBO(17, 17, 17, 1),
                        fontFamily: 'Pretendard',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: missions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: index == 0 ? 0.0 : 10.0,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    title: Text(
                                      missions[index],
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    trailing: Container(
                                      width: 85,
                                      height: 23,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(73, 156, 255, 1),
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
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${rewardPoints[index]}P',
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
                                  LinearProgressIndicator(
                                    value: 0.5,
                                    backgroundColor: Colors.grey[300],
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '미션 카테고리',
                        style: TextStyle(
                          color: Color.fromRGBO(17, 17, 17, 1),
                          fontFamily: 'Pretendard',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '전체보기',
                        style: TextStyle(
                          color: Color.fromRGBO(190, 190, 190, 1),
                          fontFamily: 'Pretendard',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color.fromRGBO(190, 190, 190, 1),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.health_and_safety, size: 40),
                          SizedBox(height: 4),
                          Text('건강'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.work, size: 40),
                          SizedBox(height: 4),
                          Text('구직'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.favorite, size: 40),
                          SizedBox(height: 4),
                          Text('마음'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.school, size: 40),
                          SizedBox(height: 4),
                          Text('교육'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    '최근 한달간 인기 미션',
                    style: TextStyle(
                      color: Color.fromRGBO(17, 17, 17, 1),
                      fontFamily: 'Pretendard',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '1',
                              style: TextStyle(
                                color: Color.fromRGBO(72, 156, 255, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              '희망의 인문학 강의 신청',
                              style: TextStyle(
                                color: Color.fromRGBO(17, 17, 17, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '1,201명 참여',
                              style: TextStyle(
                                color: Color.fromRGBO(190, 190, 190, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '2',
                              style: TextStyle(
                                color: Color.fromRGBO(72, 156, 255, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              '심리상담 “마음세우기" 참여',
                              style: TextStyle(
                                color: Color.fromRGBO(17, 17, 17, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '801명 참여',
                              style: TextStyle(
                                color: Color.fromRGBO(190, 190, 190, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '3',
                              style: TextStyle(
                                color: Color.fromRGBO(72, 156, 255, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              '[금주] 몸이 아플 때 센터의 도움 받기',
                              style: TextStyle(
                                color: Color.fromRGBO(17, 17, 17, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '501명 참여',
                              style: TextStyle(
                                color: Color.fromRGBO(190, 190, 190, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: '우리집',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment, color: Colors.black),
            label: '미션',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: '마켓',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: '마이페이지',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFFBFBFBF),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Color(0xFFBFBFBF)),
        iconSize: 24,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
