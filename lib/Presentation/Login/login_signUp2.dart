import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homission/Presentation/Mission/Home/home_screen.dart';
import 'Config.dart';
import 'package:homission/Data/Network/user_repository.dart';
import 'package:homission/Data/Network/user_model.dart';
import 'package:homission/Data/Network/user_singleton.dart';

class login_signUp2 extends StatefulWidget {
  @override
  _login_signUp2State createState() => _login_signUp2State();
}

class _login_signUp2State extends State<login_signUp2> {
  final TextEditingController _otpController = TextEditingController();
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  final UserRepository _userRepository = UserRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isOtpValid = true;

  Future<void> _verifyOtp(String email) async {

    String emailKey = email.replaceAll('.', '+');

    try {

      DatabaseEvent event = await _databaseReference.child('otps/$emailKey/otp').once();
      DataSnapshot snapshot = event.snapshot;


      String? storedOtp = snapshot.value as String?;

      if (storedOtp != null && storedOtp == _otpController.text) {

        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: '123456', // 기본 비밀번호 설정
        );

        await _saveUserInfo(email);


        setState(() {
          _isOtpValid = true;
        });

        print('OTP verified!');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {

        setState(() {
          _isOtpValid = false;
        });
        print('Invalid OTP');
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      setState(() {
        _isOtpValid = false;
      });
    }
  }

  Future<void> _saveUserInfo(String email) async {
    String emailKey = email.replaceAll('.', '+');
    await _databaseReference.child('User/$emailKey').set({
      'centerName': '',
      'nickName': '호미니',
      'point': 0,
      'isAdmin': Config().isAdmin,
    });
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;

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
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Text(
                    '2/2',
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
              width: MediaQuery.of(context).size.width / 2,
              height: 4,
              color: Color(0xFF111111),
            ),
            SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '인증번호를 입력해주세요',
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
                      color: _isOtpValid ? Color(0xFF111111) : Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    hintText: '인증번호를 입력하세요',
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
                opacity: _isOtpValid ? 0 : 1,
                child: Text(
                  '인증번호가 올바르지 않습니다',
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
                  print("_verifyOtp(email)");
                  _verifyOtp(email);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 16),
                  decoration: ShapeDecoration(
                    color: Color(0xFF489CFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '확인',
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
