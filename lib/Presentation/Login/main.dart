import 'package:flutter/material.dart';
import 'package:homission/Presentation/Profile/myPage.dart';
import 'package:homission/Presentation/responsive_positioned.dart';
import 'package:homission/Presentation/Login/login_userType.dart';
import 'package:homission/Presentation/Login/login_signUp1.dart';
import 'package:homission/Presentation/Login/login_signIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 375,
              height: 812,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    top: 534,
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  //MaterialPageRoute(builder: (context) => login_signUp1())
                                  MaterialPageRoute(
                                      builder: (context) => myPage()));
                            },
                            child: Container(
                              width: 343,
                              padding: const EdgeInsets.all(16),
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFDA1B),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                              'assets/images/userManagementSystem/kakaotalk_login.png',
                                              fit: BoxFit.cover),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: SizedBox(
                                      child: Text(
                                        '카카오톡으로 로그인',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 0.11,
                                          letterSpacing: -0.60,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login_signIn()));
                            },
                            child: Container(
                              width: 343,
                              padding: const EdgeInsets.all(16),
                              decoration: ShapeDecoration(
                                color: Color(0xFF26231D),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(2),
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
                                              'assets/images/userManagementSystem/material_symbols_alternate_email_rounded.png',
                                              fit: BoxFit.cover),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: SizedBox(
                                      child: Text(
                                        '이메일로 로그인',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 0.11,
                                          letterSpacing: -0.60,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login_userType()));
                            },
                            child: Container(
                              width: 343,
                              //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                              padding: const EdgeInsets.all(16),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 24), //위 메뉴들과 크기 맞추기용
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '아직 호미션 회원이 아니라면',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 0.11,
                                            letterSpacing: -0.60,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 0.11,
                                            letterSpacing: -0.60,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '회원가입',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w700,
                                            height: 0.11,
                                            letterSpacing: -0.60,
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
                  ),
                  Positioned(
                    left: 115,
                    top: 180,
                    child: Image.asset(
                      'assets/images/userManagementSystem/Vector_12.png',
                      width: 75,
                      height: 36,
                    ),
                  ),
                  Positioned(
                    left: 180,
                    top: 180,
                    child: Image.asset(
                      'assets/images/userManagementSystem/Vector_13.png',
                      width: 75,
                      height: 36,
                    ),
                  ),
                  Positioned(
                    left: 123,
                    top: 255,
                    child: Text(
                      '호미션',
                      style: TextStyle(
                        color: Color(0xFF27221E),
                        fontSize: 48,
                        fontFamily: 'ONE Mobile Title OTF',
                        fontWeight: FontWeight.w700,
                        height: 0.03,
                        letterSpacing: -0.96,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 127,
                    top: 356,
                    child: Text(
                      '노숙인 자립을 위한\n미션 보상 서비스',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5C5C5C),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        letterSpacing: -0.72,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
