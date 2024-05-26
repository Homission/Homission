import 'package:flutter/material.dart';

class login_userType extends StatelessWidget {
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
                  left: 16,
                  top: 104,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '어떤 사용자 유형에\n해당하는지 알려주세요',
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 24,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            letterSpacing: -0.96,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 343,
                          child: Text(
                            '미션 수행 및 기프티콘 구매는 노숙인으로,\n기부를 원하신다면 기부자로 선택해주세요',
                            style: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              letterSpacing: -0.64,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 140,
                  top: 532,
                  child: Text(
                    '호미션에 문의하기',
                    style: TextStyle(
                      color: Color(0xFF5C5C5C),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      //textDecoration: TextDecoration.underline,
                      height: 0.11,
                      letterSpacing: -0.56,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 288,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 343,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 40),
                          decoration: ShapeDecoration(
                            color: Color(0xFF489CFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '노숙인',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 0.10,
                                  letterSpacing: -0.64,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 343,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 40),
                          decoration: ShapeDecoration(
                            color: Color(0xFF1B1B1B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '기부자',
                                style: TextStyle(
                                  color: Color(0xFFFAF7EB),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 0.10,
                                  letterSpacing: -0.64,
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
                  top: 44,
                  child: Container(
                    width: 375,
                    height: 44,
                    padding: const EdgeInsets.only(right: 331),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 44,
                          //height: double.infinity,
                          //padding: const EdgeInsets.all(10),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  // padding: const EdgeInsets.only(
                                  //   top: 6.44,
                                  //   left: 4.40,
                                  //   right: 4,
                                  //   bottom: 6.44,
                                  // ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Image.asset(
                                          'assets/images/userManagementSystem/Frame26.png',
                                          fit: BoxFit.contain,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}