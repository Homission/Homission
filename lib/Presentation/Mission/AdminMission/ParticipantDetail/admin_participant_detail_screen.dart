import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AdminParticipantDetailScreen extends StatelessWidget {
  final int participantId; // Example parameter to identify the participant

  const AdminParticipantDetailScreen({Key? key, required this.participantId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // 수정하기 버튼 클릭 시 처리할 로직 추가
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              // 휴지통 버튼 클릭 시 처리할 로직 추가
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '김말숙',
                style: TextStyle(
                  color: Color.fromRGBO(17, 17, 17, 1),
                  fontFamily: 'Pretendard',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow(
                icon: 'assets/images/vector.svg',
                title: '참여자 ID',
                value: 'homission@gmail.com',
              ),
              const SizedBox(height: 8),
              _buildDetailRow(
                icon: 'assets/images/vector.svg',
                title: '미션명',
                value: '온라인 구직 신청',
              ),
              const SizedBox(height: 8),
              _buildDetailRow(
                icon: 'assets/images/vector.svg',
                title: '미션 단계',
                value: '단일 미션',
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 375,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Frame225.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '구직 신청으로 진짜로 일자리를 얻게되어 몹시 기쁩니다. 정상적인 생활을 하는데 가장 도움이 많이 됐어요\n\n온라인 구직 신청 폼을 찾기가 어려워서 힘들었어요.. 좀 보완되면 좀 더 좋을 것 같아요!',
                style: TextStyle(
                  color: Color.fromRGBO(17, 17, 17, 1),
                  fontFamily: 'Pretendard',
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(235, 38, 97, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    onPressed: () {
                      // 반려 버튼 클릭 시 처리할 로직 추가
                    },
                    child: const Text(
                      '반려',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Pretendard',
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(72, 156, 255, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    onPressed: () {
                      // 승인 버튼 클릭 시 처리할 로직 추가
                    },
                    child: const Text(
                      '승인',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Pretendard',
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required String icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: <Widget>[
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: SvgPicture.asset(
            icon,
            semanticsLabel: 'icon',
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(92, 92, 92, 1),
            fontFamily: 'Pretendard',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: Color.fromRGBO(92, 92, 92, 1),
            fontFamily: 'Pretendard',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
