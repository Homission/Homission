import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MissionStepScreen extends StatefulWidget {
  @override
  _MissionStepScreenState createState() => _MissionStepScreenState();
}

class _MissionStepScreenState extends State<MissionStepScreen> {
  List<bool> _isStepExpanded = [true]; // Initially, one step is expanded.

  void _addStep() {
    if (_isStepExpanded.length < 3) {
      setState(() {
        _isStepExpanded.add(false);
      });
    }
  }

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
                '3/3',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  '미션 단계를 설정해주세요',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Pretendard',
                    fontSize: 24,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                for (int i = 0; i < _isStepExpanded.length; i++)
                  Column(
                    children: [
                      _buildStepCard(i + 1, _isStepExpanded[i]),
                      const SizedBox(height: 8),
                    ],
                  ),
                if (_isStepExpanded.length < 3)
                  GestureDetector(
                    onTap: _addStep,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: const Color.fromRGBO(226, 226, 226, 1),
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/vector.svg',
                            semanticsLabel: 'vector',
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '단계 추가',
                            style: TextStyle(
                              color: const Color.fromRGBO(190, 190, 190, 1),
                              fontFamily: 'Pretendard',
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(72, 156, 255, 1),
                  minimumSize: Size(double.infinity, 58),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Save button logic
                },
                child: const Center(
                  child: Text(
                    '저장',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pretendard',
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard(int stepNumber, bool isExpanded) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isStepExpanded[stepNumber - 1] = !_isStepExpanded[stepNumber - 1];
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color.fromRGBO(226, 226, 226, 1),
            width: 1.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$stepNumber단계',
                  style: TextStyle(
                    color: const Color.fromRGBO(17, 17, 17, 1),
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const Spacer(),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: const Color.fromRGBO(226, 226, 226, 1),
                ),
              ],
            ),
            if (isExpanded) ...[
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: '미션 설명',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(226, 226, 226, 1),
                      width: 1.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: '포인트',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(226, 226, 226, 1),
                      width: 1.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
