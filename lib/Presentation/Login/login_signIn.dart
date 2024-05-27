import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:homission/Presentation/Login/main.dart';

class login_signIn extends StatefulWidget {
  const login_signIn({super.key});

  @override
  State<login_signIn> createState() => _login_signIn_State();
}

class _login_signIn_State extends State<login_signIn> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwardController = new TextEditingController();
  Widget _changedTextWidget = Container();

  String _email = "homission@gmail.com";
  String _password = "0000";

  void checkText(String text) {
    _changedTextWidget = Container(
      child: Text.rich(
        //Text.rich 와 TextSpan 을 사용하여 다양한 스타일의 텍스트를 한줄에 표시할 수 있게 하는 위젯
        TextSpan(
          text: '=> ', //기본 스타일의 텍스트 (default text style)
          children: [
            TextSpan(
              //TextSpan 위젯을 이용하여 다양한 스타일의 텍스트 사용 가능
              text: '$text',
              style: TextStyle(
                fontSize: 20,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
    setState(() {}); //setState 를 사용하여 화면 다시 그려줌
  }

  @override
  void initState() {
    super.initState();
  }

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
                  top: 0,
                  child: Container(
                    width: 375,
                    height: 44,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(width: 375, height: 44),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 222,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '이메일',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 0.11,
                                        letterSpacing: -0.28,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      width: 343,
                                      //height: 50,
                                      padding: const EdgeInsets.all(16),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF111111)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: TextField(
                                              controller: _emailController,
                                              onChanged: (text) {
                                                checkText(text);
                                              },
                                              decoration: InputDecoration(
                                                  hintText: '123456@123454.com',
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0)),
                                              // style: TextStyle(
                                              //   color: Color(0xFF111111),
                                              //   fontSize: 16,
                                              //   fontFamily: 'Pretendard',
                                              //   fontWeight: FontWeight.w400,
                                              //   height: 0.10,
                                              //   letterSpacing: -0.32,
                                              // ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Opacity(
                                      opacity: 0,
                                      child: Text(
                                        '****@****.*** 형식으로 입력해주세요',
                                        style: TextStyle(
                                          color: Color(0xFFEB2661),
                                          fontSize: 14,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                          letterSpacing: -0.28,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '비밀번호',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 0.11,
                                        letterSpacing: -0.28,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      width: 343,
                                      padding: const EdgeInsets.all(16),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF111111)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: TextField(
                                              controller: _passwardController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  hintText: '*******',
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0)),
                                              // style: TextStyle(
                                              //   color: Color(0xFF111111),
                                              //   fontSize: 16,
                                              //   fontFamily: 'Pretendard',
                                              //   fontWeight: FontWeight.w400,
                                              //   height: 0.10,
                                              //   letterSpacing: -0.32,
                                              // ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Opacity(
                                      opacity: 0,
                                      child: Text(
                                        '잘못된 비밀번호입니다.',
                                        style: TextStyle(
                                          color: Color(0xFFEB2661),
                                          fontSize: 14,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                          letterSpacing: -0.28,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            if ((_emailController.text == "${_email}") &&
                                (_passwardController.text == "${_password}")) {
                              Navigator.push(
                                  context,
                                  //MaterialPageRoute(builder: (context) => login_signUp1())
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()));
                            }
                          },
                          child: Container(
                            width: 343,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
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
                                  '로그인',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 0.10,
                                    letterSpacing: -0.64,
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
                  left: 128,
                  top: 92,
                  child: Container(
                    width: 120,
                    height: 90,
                    child: (Expanded(
                      child: Image.asset(
                          'assets/images/userManagementSystem/image3.png',
                          fit: BoxFit.contain),
                    )),
                  ),
                ),
                Positioned(
                  left: 140,
                  top: 740,
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
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  },
                                  child: Container(
                                    //height: double.infinity,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                              'assets/images/userManagementSystem/Frame26.png',
                                              fit: BoxFit.cover),
                                        )
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
