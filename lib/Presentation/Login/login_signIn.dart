import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homission/Presentation/Mission/Home/admin_bottom_tap_screen.dart';
import 'package:homission/Presentation/Mission/Home/bottom_tap_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homission/Presentation/Mission/Home/home_screen.dart';
import 'package:homission/Presentation/Login/main.dart';
import 'Config.dart';

class login_signIn extends StatefulWidget {
  const login_signIn({super.key});

  @override
  State<login_signIn> createState() => _login_signIn_State();
}

class _login_signIn_State extends State<login_signIn> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  Widget _changedTextWidget = Container();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isValidEmail = true;
  bool _isWrongPassword = false;
  String _email = "homission@gmail.com";
  String _password = "0000";

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  void _attemptLogin() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    bool isValid = await signInWithEmailAndPassword(email, password);
    if (isValid) {
      if (Config().isAdmin == false) {
        print("Login successful!");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BottomTapScreen()));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AdminBottomTapScreen()));
      }
    } else {
      print("Login failed!");
      _isWrongPassword = true;
    }
  }

  void _validateEmail(String email) {
    setState(() {
      // 이메일 정규식을 사용하여 유효성 검사
      _isValidEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    });
  }

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
    // Get the screen size
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: size.width,
                    height: 44,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(width: size.width, height: 44),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: size.height * 0.273, // Adjusting to screen height
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
                                    const SizedBox(height: 16),
                                    Container(
                                      width: size.width - 32,
                                      // 16 padding each side
                                      padding: const EdgeInsets.all(16),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: _isValidEmail ? Color(0xFF111111) : Colors.red,
                                          ),
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
                                              //onChanged: _validateEmail,
                                        onSubmitted: (_) => _validateEmail(_emailController.text),
                                              decoration: InputDecoration(
                                                  hintText: '123456@123454.com',
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 0),
                                              ),

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Opacity(
                                      opacity: _isValidEmail? 0: 1,
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
                              const SizedBox(height: 32),
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
                                    const SizedBox(height: 16),
                                    Container(
                                      width: size.width - 32,
                                      padding: const EdgeInsets.all(16),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: _isWrongPassword ? Colors.red : Color(0xFF111111)),
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
                                              controller: _passwordController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  hintText: '*******',
                                                  border: InputBorder.none,
                                                  isDense: true,
                                                  contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Opacity(
                                      opacity: _isWrongPassword? 1 : 0,
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
                        const SizedBox(height: 32),
                        GestureDetector(
                          onTap: () {
                            _attemptLogin();
                          },
                          child: Container(
                            width: size.width - 32,
                            height: 58,
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
                  left: (size.width - 120) / 2,
                  top: size.height * 0.113,
                  child: Container(
                    width: 120,
                    height: 90,
                    child: Image.asset(
                        'assets/images/userManagementSystem/image3.png',
                        fit: BoxFit.contain),
                  ),
                ),

                Positioned(
                  left: (size.width - 90) / 2, // Center horizontally
                  top: size.height * 0.91,
                  child: Text(
                    '호미션에 문의하기',
                    style: TextStyle(
                      color: Color(0xFF5C5C5C),
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: -0.56,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 44,
                  child: Container(
                    width: size.width,
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
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyHomePage()));
                                },
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Image.asset(
                                      'assets/images/userManagementSystem/Frame26.png',
                                      fit: BoxFit.cover),
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
