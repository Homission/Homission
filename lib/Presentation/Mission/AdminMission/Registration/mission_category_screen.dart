import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homission/Presentation/Mission/AdminMission/Registration/mission_name_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MissionCategoryScreen(),
    );
  }
}

class MissionCategoryScreen extends StatefulWidget {
  @override
  _MissionCategoryScreenState createState() => _MissionCategoryScreenState();
}

class _MissionCategoryScreenState extends State<MissionCategoryScreen> {
  String selectedCategory = '';

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
                '1/3',
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
            value: 0.33,
            backgroundColor: Colors.grey[300],
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '미션 카테고리를 선택해주세요',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Pretendard',
                fontSize: 24,
                height: 1.5,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: (156 / 106),
                children: [
                  _buildCategoryButton('건강', 'assets/images/health.svg'),
                  _buildCategoryButton('구직', 'assets/images/job.svg'),
                  _buildCategoryButton('마음', 'assets/images/mind.svg'),
                  _buildCategoryButton('교육', 'assets/images/education.svg'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedCategory.isEmpty
                    ? Colors.grey[300]
                    : Color.fromRGBO(72, 156, 255, 1),
                minimumSize: Size(double.infinity, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: selectedCategory.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MissionNameScreen(),
                        ),
                      );
                    },
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

  Widget _buildCategoryButton(String category, String imagePath) {
    bool isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        height: 106,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.black : Color.fromRGBO(56, 56, 56, 1),
            width: 1,
          ),
          color: isSelected ? Colors.black : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              semanticsLabel: category,
              color: isSelected ? Colors.white : Colors.black,
            ),
            SizedBox(height: 8),
            Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontFamily: 'Pretendard',
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
