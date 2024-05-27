import 'package:flutter/material.dart';

import 'package:homission/Presentation/Login/main.dart';
import 'package:homission/Presentation/Mission/Home/home_screen.dart';
import 'package:homission/Presentation/Mission/mission_screen.dart';
import 'package:homission/Gifticon/MarketPage.dart';


class myPage extends StatelessWidget {
  //무조건 진입할 때 한번 데이터 가져와서 넣어주면 됨
  String _userName = "김호미"; // 추후 data에서 가져오는걸로
  int _point = 1000; // 추후 data에서 가져오는걸로
  int _buyCount = 2; // 추후 data에서 가져오는걸로
  int _usedCount = 5; // 추후 data에서 가져오는걸로

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 375,
            height: 812,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 44,
                  child: Container(
                    padding: const EdgeInsets.only(left: 16),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 96,
                          height: 28,
                          child: Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                    'assets/images/userManagementSystem/image4.png',
                                    fit: BoxFit.cover),
                              )
                            ],
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
                  top: 112,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 343,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Text(
                                    '${_userName}',
                                    style: TextStyle(
                                      color: Color(0xFF111111),
                                      fontSize: 20,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 0.08,
                                      letterSpacing: -0.40,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 26),
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      padding: const EdgeInsets.only(
                                        top: 1.67,
                                        left: 4.51,
                                        right: 4.53,
                                        bottom: 1.67,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Image.asset(
                                                'assets/images/userManagementSystem/material_symbols_arrow_forward_ios_rounded.png',
                                                fit: BoxFit.cover),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          //width: MediaQuery.of(context).size.width,
                          width: 343,
                          height: 80,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: ShapeDecoration(
                            color: Color(0xFFF5F5F5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Opacity(
                                                opacity: 0.32,
                                                child: Text(
                                                  '내 포인트',
                                                  textAlign: TextAlign.center,
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
                                            ),
                                            const SizedBox(height: 28),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                '${_point}p',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF111111),
                                                  fontSize: 18,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0.09,
                                                  letterSpacing: -0.36,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Opacity(
                                      opacity: 0.08,
                                      child: Container(
                                        width: 1,
                                        height: 48,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF111111)),
                                      ),
                                    ),
                                    //const SizedBox(width: 8),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Opacity(
                                                opacity: 0.32,
                                                child: Text(
                                                  '구매 완료',
                                                  textAlign: TextAlign.center,
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
                                            ),
                                            const SizedBox(height: 28),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                '${_buyCount}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF111111),
                                                  fontSize: 18,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0.09,
                                                  letterSpacing: -0.36,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Opacity(
                                      opacity: 0.08,
                                      child: Container(
                                        width: 1,
                                        height: 48,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF111111)),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Opacity(
                                                opacity: 0.32,
                                                child: Text(
                                                  '사용 완료',
                                                  textAlign: TextAlign.center,
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
                                            ),
                                            const SizedBox(height: 28),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                '${_usedCount}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF111111),
                                                  fontSize: 18,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0.09,
                                                  letterSpacing: -0.36,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                ),
                Positioned(
                  left: 0,
                  top: 272,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 375,
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
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
                              const SizedBox(width: 16),
                              Container(
                                width: 16,
                                height: 16,
                                padding: const EdgeInsets.only(
                                  top: 1.67,
                                  left: 4.51,
                                  right: 4.53,
                                  bottom: 1.67,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                          'assets/images/userManagementSystem/material_symbols_arrow_forward_ios_rounded_black.png',
                                          fit: BoxFit.cover),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 375,
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
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
                                height: 16,
                                padding: const EdgeInsets.only(
                                  top: 1.67,
                                  left: 4.51,
                                  right: 4.53,
                                  bottom: 1.67,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                          'assets/images/userManagementSystem/material_symbols_arrow_forward_ios_rounded_black.png',
                                          fit: BoxFit.cover),
                                    )
                                  ],
                                ),
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
                  top: 264,
                  child: Container(
                    width: 375,
                    height: 8,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 721,
                  child: Container(
                    height: 91,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 375,
                          height: 1,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFF2F2F2)),
                            ),
                          ),
                        ),
                        Container(
                          //width: MediaQuery.of(context).size.width,
                          width: 375,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                          child: GestureDetector(
                          onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => HomeScreen())); //홈 페이지로
                        },
                                child: Container(
                                  height: 56,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        padding: const EdgeInsets.only(
                                          top: 3.53,
                                          left: 1.40,
                                          right: 1.39,
                                          bottom: 3,
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                  'assets/images/userManagementSystem/homeIcon.png',
                                                  fit: BoxFit.cover),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '우리집',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFBEBEBE),
                                          fontSize: 10,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: 0.16,
                                          letterSpacing: -0.02,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MissionScreen())); //미션페이지로
                                  },
                                child: Container(
                                  height: 56,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        padding: const EdgeInsets.only(
                                          top: 2,
                                          left: 2.58,
                                          right: 2.61,
                                          bottom: 2,
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                  'assets/images/userManagementSystem/missionIcon.png',
                                                  fit: BoxFit.cover),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '미션',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFBEBEBE),
                                          fontSize: 10,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: 0.16,
                                          letterSpacing: -0.02,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MarketPage())); //마켓페이지로
                                  },
                                child: Container(
                                  height: 56,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                  'assets/images/userManagementSystem/marketIcon.png',
                                                  fit: BoxFit.cover),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '마켓',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFBEBEBE),
                                          fontSize: 10,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w700,
                                          height: 0.16,
                                          letterSpacing: -0.02,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MyHomePage())); //마이페이지 현재 페이지임
                                  },
                                  child: Container(
                                    height: 56,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          padding: const EdgeInsets.only(
                                            top: 3.50,
                                            left: 4,
                                            right: 4,
                                            bottom: 3,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Image.asset(
                                                    'assets/images/userManagementSystem/mypageIcon.png',
                                                    fit: BoxFit.cover),
                                              )
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '마이페이지',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF111111),
                                            fontSize: 10,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w700,
                                            height: 0.16,
                                            letterSpacing: -0.02,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
