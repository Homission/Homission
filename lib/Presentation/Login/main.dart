import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:homission/Presentation/Profile/myPage.dart';
import 'package:homission/Presentation/responsive_positioned.dart';
import 'package:homission/Presentation/Login/login_userType.dart';
import 'package:homission/Presentation/Login/login_signUp1.dart';
import 'package:homission/Presentation/Login/login_signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import '/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
   );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    // Get the device width and height
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          color: Color(0xFFF5F5F5),
          child: Stack(
            children: [
              Positioned(
                left: deviceWidth * 0.04,
                top: deviceHeight * 0.66,
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
                            MaterialPageRoute(builder: (context) => myPage()),
                          );
                        },
                        child: Container(
                          width: deviceWidth * 0.92,
                          padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFDA1B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0),
                                ),
                                child: Image.asset(
                                  'assets/images/userManagementSystem/kakaotalk_login.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  '카카오톡으로 로그인',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
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
                                builder: (context) => login_signIn()),
                          );
                        },
                        child: Container(
                          width: deviceWidth * 0.92,
                          padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            color: Color(0xFF26231D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(2),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Image.asset(
                                  'assets/images/userManagementSystem/material_symbols_alternate_email_rounded.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  '이메일로 로그인',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
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
                                builder: (context) => login_signUp1()),
                          );
                        },
                        child: Container(
                          width: deviceWidth * 0.92,
                          padding: const EdgeInsets.all(16),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 24),
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
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '회원가입',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
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
                left: deviceWidth * 0.31,
                top: deviceHeight * 0.22,
                child: Image.asset(
                  'assets/images/userManagementSystem/Vector_12.png',
                  width: deviceWidth * 0.2,
                  height: deviceHeight * 0.05,
                ),
              ),
              Positioned(
                left: deviceWidth * 0.48,
                top: deviceHeight * 0.22,
                child: Image.asset(
                  'assets/images/userManagementSystem/Vector_13.png',
                  width: deviceWidth * 0.2,
                  height: deviceHeight * 0.05,
                ),
              ),
              Positioned(
                left: deviceWidth * 0.31,
                top: deviceHeight * 0.32,
                child: Text(
                  '호미션',
                  style: TextStyle(
                    color: Color(0xFF27221E),
                    fontSize: deviceWidth * 0.13,
                    fontFamily: 'ONE Mobile Title OTF',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: deviceWidth * 0.30,
                top: deviceHeight * 0.44,
                child: Text(
                  '노숙인 자립을 위한\n미션 보상 서비스',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontSize: deviceWidth * 0.05,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
