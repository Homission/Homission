import 'package:flutter/material.dart';

import 'package:homission/Presentation/Login/main.dart';
import 'package:homission/Presentation/Mission/Home/home_screen.dart';
import 'package:homission/Presentation/Mission/mission_screen.dart';
import 'package:homission/Gifticon/MarketPage.dart';


class myPage extends StatelessWidget {
  //무조건 진입할 때 한번 데이터 가져와서 넣어주면 됨
  String _userName = "김호미"; // 추후 data에서 가져오는걸로
  int _point = 30000; // 추후 data에서 가져오는걸로
  int _buyCount = 1; // 추후 data에서 가져오는걸로
  int _usedCount = 0; // 추후 data에서 가져오는걸로

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: MediaQuery
                        .of(context)
                        .padding
                        .top + 44,
                    child: Container(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 96,
                            height: 28,
                            child: Image.asset(
                              'assets/images/userManagementSystem/image4.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 219),
                          Container(
                            width: 44,
                            height: 44,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: MediaQuery
                        .of(context)
                        .padding
                        .top + 112,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _userName,
                                style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 20,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 0.08,
                                  letterSpacing: -0.40,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigate to edit profile screen
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      '기본정보 수정',
                                      style: TextStyle(
                                        color: Color(0xFF878787),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 0.11,
                                        letterSpacing: -0.28,
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    Container(
                                      width: 16,
                                      height: 16,
                                      padding: const EdgeInsets.all(2),
                                      child: Image.asset(
                                        'assets/images/userManagementSystem/material_symbols_arrow_forward_ios_rounded.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 32,
                            height: 80,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.32,
                                      child: Text(
                                        '내 포인트',
                                        style: TextStyle(
                                          color: Color(0xFF111111),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: 0.13,
                                          letterSpacing: -0.24,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 28),
                                    Text(
                                      '$_point p',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 18,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 0.09,
                                        letterSpacing: -0.36,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 1,
                                  height: 48,
                                  color: Colors.black.withOpacity(0.08),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.32,
                                      child: Text(
                                        '구매 완료',
                                        style: TextStyle(
                                          color: Color(0xFF111111),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: 0.13,
                                          letterSpacing: -0.24,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 28),
                                    Text(
                                      '$_buyCount',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 18,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 0.09,
                                        letterSpacing: -0.36,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 1,
                                  height: 48,
                                  color: Colors.black.withOpacity(0.08),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.32,
                                      child: Text(
                                        '사용 완료',
                                        style: TextStyle(
                                          color: Color(0xFF111111),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: 0.13,
                                          letterSpacing: -0.24,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 28),
                                    Text(
                                      '$_usedCount',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 18,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 0.09,
                                        letterSpacing: -0.36,
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
                  ),
                  Positioned(
                    left: 0,
                    top: MediaQuery.of(context).padding.top + 265, // 바로 위에 위치하도록 조정
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 7, // 또는 다른 값을 지정하여 두께를 조절할 수 있습니다.
                      color: Color(0xFFF5F5F5), // 원하는 색상으로 변경 가능
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: MediaQuery.of(context).padding.top + 272,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  //height: 30, // 높이 조정
                                  child: Text(
                                    '포인트 사용 내역',
                                    style: TextStyle(
                                      color: Color(0xFF111111),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 0.10,
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30),
                              Container(
                                width: 16,
                                height: 16, // 높이 조정
                                padding: const EdgeInsets.all(2),
                                child: Image.asset(
                                  'assets/images/userManagementSystem/material_symbols_arrow_forward_ios_rounded_black.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30), // Row 사이의 간격
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  //height: 30, // 높이 조정
                                  child: Text(
                                    '비밀번호 변경',
                                    style: TextStyle(
                                      color: Color(0xFF111111),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 0.10,
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: 16,
                                height: 16, // 높이 조정
                                padding: const EdgeInsets.all(2),
                                child: Image.asset(
                                  'assets/images/userManagementSystem/material_symbols_arrow_forward_ios_rounded_black.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
