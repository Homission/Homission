import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'mission_step_screen.dart';

class MissionNameScreen extends StatefulWidget {
  @override
  _MissionNameScreenState createState() => _MissionNameScreenState();
}

class _MissionNameScreenState extends State<MissionNameScreen> {
  TextEditingController _controller = TextEditingController();
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                '2/3',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Pretendard',
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(
            value: 0.66,
            backgroundColor: Colors.grey[300],
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '미션명을 입력해주세요',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Pretendard',
                fontSize: 24,
                height: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isValid ? Colors.grey : Color.fromRGBO(235, 38, 97, 1),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _controller,
                maxLength: 20,
                onChanged: (text) {
                  setState(() {
                    isValid = text.length <= 20;
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  hintText: '20자 이내로 입력해주세요',
                  border: InputBorder.none,
                  counterText: '',
                ),
              ),
            ),
          ),
          if (!isValid)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                '20자 이내 작성해주세요',
                style: TextStyle(
                  color: Color.fromRGBO(235, 38, 97, 1),
                  fontFamily: 'Pretendard',
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isValid && _controller.text.isNotEmpty
                    ? Color.fromRGBO(72, 156, 255, 1)
                    : Colors.grey[300],
                minimumSize: Size(double.infinity, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: isValid && _controller.text.isNotEmpty
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MissionStepScreen(),
                        ),
                      );
                    }
                  : null,
              child: Text(
                '다음',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Pretendard',
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
