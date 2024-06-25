import 'package:flutter/material.dart';
import 'package:homission/Presentation/Login/login_signUp2.dart';
import 'package:homission/Presentation/Profile/myPage.dart';
import 'package:homission/Presentation/Login/main.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class login_signUp1 extends StatefulWidget {
  const login_signUp1({super.key});

  @override
  State<login_signUp1> createState() => _login_signUp1_State();
}

class _login_signUp1_State extends State<login_signUp1> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isValidEmail = true;
  bool _isOtpSent = false;
  void _validateEmail(String email) {
    setState(() {
      _isValidEmail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    });
  }

  Future<void> _sendOtp() async {
    if (_isValidEmail) {
      HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendOtp');
      final response = await callable.call({'email': _emailController.text});
      print("_sendOtp()");
      log('_sendOtp()', name: 'MyApp');
      if (response.data['success']) {
        print("response.data['success'] : true");
        log('response.data[success]: true', name: 'MyApp');
        setState(() {
          _isOtpSent = true;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => login_signUp2(),
            settings: RouteSettings(arguments: _emailController.text),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => login_signUp2(),
            settings: RouteSettings(arguments: _emailController.text),
          ),
        );
        print("response.data['success'] : false");
        log('response.data[success]: false', name: 'MyApp');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 44),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                  onTap: () {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => MyHomePage()),
            );
            },
                  child: Container(
                    width: 44,
                    height: 44,
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.arrow_back),
                  ),
                  ),
                  Text(
                    '1/2',
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 44),
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2,
              height: 4,
              color: Color(0xFF111111),
            ),
            SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '이메일을 알려주세요',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 24,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: _isValidEmail ? Color(0xFF111111) : Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextField(
                  controller: _emailController,
                  onChanged: _validateEmail,
                  decoration: InputDecoration(
                    hintText: '123456@123454.com',
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Opacity(
                opacity: _isValidEmail ? 0 : 1,
                child: Text(
                  '****@****.*** 형식으로 입력해주세요',
                  style: TextStyle(
                    color: Color(0xFFEB2661),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  if (_isValidEmail) {
                    _sendOtp();
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  decoration: ShapeDecoration(
                    color: _isValidEmail ? Color(0xFF489CFF) : Color(
                        0xFFBFDDFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '다음',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 34),
          ],
        ),
      ),
    );
  }
}
