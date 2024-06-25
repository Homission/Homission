import 'package:flutter/material.dart';

class MissionEditScreen extends StatefulWidget {
  @override
  _MissionEditScreenState createState() => _MissionEditScreenState();
}

class _MissionEditScreenState extends State<MissionEditScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              // Save button logic
            },
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
                DefaultTabController(
                  length: 5,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          indicator: const BoxDecoration(),
                          labelStyle: const TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          tabs: [
                            for (var i = 0; i < 5; i++)
                              Tab(
                                child: Container(
                                  height: 30,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  margin: const EdgeInsets.only(right: 8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _tabController.index == i
                                          ? const Color.fromRGBO(18, 18, 18, 1)
                                          : const Color.fromRGBO(
                                              227, 227, 227, 1),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    color: _tabController.index == i
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (i == 1)
                                          Icon(
                                            Icons.health_and_safety,
                                            size: 16,
                                            color: _tabController.index == i
                                                ? Colors.black
                                                : const Color.fromRGBO(
                                                    227, 227, 227, 1),
                                          ),
                                        if (i == 2)
                                          Icon(
                                            Icons.work,
                                            size: 16,
                                            color: _tabController.index == i
                                                ? Colors.black
                                                : const Color.fromRGBO(
                                                    227, 227, 227, 1),
                                          ),
                                        if (i == 3)
                                          Icon(
                                            Icons.favorite,
                                            size: 16,
                                            color: _tabController.index == i
                                                ? Colors.black
                                                : const Color.fromRGBO(
                                                    227, 227, 227, 1),
                                          ),
                                        if (i == 4)
                                          Icon(
                                            Icons.school,
                                            size: 16,
                                            color: _tabController.index == i
                                                ? Colors.black
                                                : const Color.fromRGBO(
                                                    227, 227, 227, 1),
                                          ),
                                        const SizedBox(width: 4),
                                        Text(
                                          ['전체', '건강', '구직', '마음', '교육'][i],
                                          style: TextStyle(
                                            color: _tabController.index == i
                                                ? Colors.black
                                                : const Color.fromRGBO(
                                                    227, 227, 227, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
                          tabAlignment: TabAlignment.start,
                          dividerColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text('미션명', style: _labelTextStyle),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(17, 17, 17, 1),
                        width: 1.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                  ),
                ),
                const SizedBox(height: 16),
                Text('미션 수행 가이드', style: _labelTextStyle),
                const SizedBox(height: 8),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(17, 17, 17, 1),
                        width: 1.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 24.0),
                  ),
                ),
                const SizedBox(height: 16),
                Text('포인트', style: _labelTextStyle),
                const SizedBox(height: 8),
                TextField(
                  style: const TextStyle(
                    color: Color.fromRGBO(72, 156, 255, 1),
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(17, 17, 17, 1),
                        width: 1.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
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
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
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
                      fontWeight: FontWeight.normal,
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

  TextStyle get _labelTextStyle => const TextStyle(
        color: Color.fromRGBO(17, 17, 17, 1),
        fontFamily: 'Pretendard',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );
}
