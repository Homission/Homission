import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompletedScreen extends StatefulWidget {
  @override
  _CompletedScreenState createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  final List<String> missions = [
    '완료된 미션 1',
    '완료된 미션 2',
    '완료된 미션 3',
    '완료된 미션 4',
    '완료된 미션 5',
  ];

  final List<int> rewardPoints = [
    100,
    200,
    300,
    400,
    500,
  ];

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: missions.length,
      itemBuilder: (context, index) {
        final isSelected = _selectedIndex == index;
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: index == 0 ? 16.0 : 10.0,
            bottom: index == missions.length - 1 ? 16.0 : 0.0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? Color.fromRGBO(73, 156, 255, 1)
                      : Color.fromRGBO(245, 245, 245, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      title: Text(
                        missions[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Container(
                        width: 85,
                        height: 23,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.white
                              : Color.fromRGBO(73, 156, 255, 1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'asset_mission/image_mission/material-symbols_rewarded-ads-outline.svg',
                                width: 16,
                                height: 16,
                                color: isSelected
                                    ? Color.fromRGBO(73, 156, 255, 1)
                                    : Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${rewardPoints[index]}P',
                                style: TextStyle(
                                  color: isSelected
                                      ? Color.fromRGBO(73, 156, 255, 1)
                                      : Colors.white,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
