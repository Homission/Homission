import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_app_bar.dart';

class MissionDetailScreen extends StatefulWidget {
  const MissionDetailScreen({super.key});

  @override
  _MissionDetailScreenState createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> {
  bool isParticipating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 32), // 상단 앱바와의 여백
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(208, 230, 255, 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Text(
                        '참여중',
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
                Container(
                  child: Column(
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
                          alignment: Alignment.centerLeft, // 왼쪽 정렬
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
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
                        '완료율 50%',
                        style: TextStyle(
                          color: Color.fromRGBO(72, 156, 255, 1),
                          fontFamily: 'Pretendard',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
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
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: SizedBox(
              width: double.infinity,
              height: 58, // 버튼 높이 58로 설정
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isParticipating
                      ? const Color.fromRGBO(17, 17, 17, 1)
                      : const Color.fromRGBO(72, 156, 255, 1),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isParticipating = !isParticipating;
                  });
                },
                child: Text(
                  isParticipating ? '인증하기' : '참여하기',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MissionDetailScreen(),
  ));
}
