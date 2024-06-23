import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../DetailMission/detail_screen.dart';
import 'package:provider/provider.dart';
import 'browse_screen_viewmodel.dart';

import 'package:homission/Presentation/Mission/Usecase/MissionDetailUseCase.dart';

class BrowseScreen extends StatefulWidget {
  final String userId;
  final MissionDetailUseCase missionDetailUseCase;

  const BrowseScreen({
    required this.userId,
    required this.missionDetailUseCase,
    super.key,
  });

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen>
    with SingleTickerProviderStateMixin {
  late BrowseScreenViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<BrowseScreenViewModel>(context, listen: false);
    viewModel.initialize(this); // Pass the TickerProvider
  }

  @override
  void dispose() {
    viewModel.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BrowseScreenViewModel>(
      builder: (context, viewModel, child) {
        return Stack(
          children: [
            DefaultTabController(
              length: 5,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TabBar(
                      controller: viewModel.tabController,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              margin: const EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: viewModel.tabController?.index == i
                                      ? const Color.fromRGBO(18, 18, 18, 1)
                                      : const Color.fromRGBO(227, 227, 227, 1),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: viewModel.tabController?.index == i
                                    ? Colors.white
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (i == 1)
                                      Icon(
                                        Icons.health_and_safety,
                                        size: 16,
                                        color:
                                            viewModel.tabController?.index == i
                                                ? Colors.black
                                                : const Color.fromRGBO(
                                                    227, 227, 227, 1),
                                      ),
                                    if (i == 2)
                                      Icon(
                                        Icons.work,
                                        size: 16,
                                        color:
                                            viewModel.tabController?.index == i
                                                ? Colors.black
                                                : const Color.fromRGBO(
                                                    227, 227, 227, 1),
                                      ),
                                    if (i == 3)
                                      Icon(
                                        Icons.favorite,
                                        size: 16,
                                        color:
                                            viewModel.tabController?.index == i
                                                ? Colors.black
                                                : const Color.fromRGBO(
                                                    227, 227, 227, 1),
                                      ),
                                    if (i == 4)
                                      Icon(
                                        Icons.school,
                                        size: 16,
                                        color:
                                            viewModel.tabController?.index == i
                                                ? Colors.black
                                                : const Color.fromRGBO(
                                                    227, 227, 227, 1),
                                      ),
                                    const SizedBox(width: 4),
                                    Text(
                                      ['전체', '건강', '구직', '마음', '교육'][i],
                                      style: TextStyle(
                                        color:
                                            viewModel.tabController?.index == i
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
                      labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                    ),
                  ),
                  Container(
                    height: 54,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: viewModel.toggleCheck,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: viewModel.isChecked
                                        ? Colors.black
                                        : const Color.fromRGBO(
                                            227, 227, 227, 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: viewModel.isChecked
                                      ? const Icon(Icons.check,
                                          color: Colors.white, size: 18)
                                      : null,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '내 센터만 보기',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: viewModel.isChecked
                                      ? Colors.black
                                      : const Color.fromRGBO(227, 227, 227, 1),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                viewModel.selectedSortOption,
                                style: const TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: viewModel.toggleSortOptions,
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.missions.length,
                      itemBuilder: (context, index) {
                        final mission = viewModel.missions[index];
                        final isSelected = viewModel.selectedIndex == index;
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: index == 0 ? 16.0 : 10.0,
                            bottom: index == viewModel.missions.length - 1
                                ? 16.0
                                : 0.0,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: () {
                                viewModel.selectMission(index);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MissionDetailScreen(
                                      userId: widget.userId,
                                      missionId: mission.missionID,
                                      missionDetailUseCase:
                                          widget.missionDetailUseCase,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color.fromRGBO(73, 156, 255, 1)
                                      : const Color.fromRGBO(245, 245, 245, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          width: 85,
                                          height: 23,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.white
                                                : const Color.fromRGBO(
                                                    73, 156, 255, 1),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Center(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                  'asset_mission/image_mission/material-symbols_rewarded-ads-outline.svg',
                                                  width: 16,
                                                  height: 16,
                                                  color: isSelected
                                                      ? const Color.fromRGBO(
                                                          73, 156, 255, 1)
                                                      : Colors.white,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '${mission.rewardPoints}P',
                                                  style: TextStyle(
                                                    color: isSelected
                                                        ? const Color.fromRGBO(
                                                            73, 156, 255, 1)
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
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'asset_mission/image_mission/material-symbols_group-outline-rounded.svg',
                                              width: 16,
                                              height: 16,
                                              color: isSelected
                                                  ? Colors.white
                                                  : const Color.fromRGBO(
                                                      136, 136, 136, 1),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              mission.participants,
                                              style: TextStyle(
                                                color: isSelected
                                                    ? Colors.white
                                                    : const Color.fromRGBO(
                                                        136, 136, 136, 1),
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 40),
                                          Text(
                                            mission.title,
                                            style: TextStyle(
                                              color: isSelected
                                                  ? Colors.white
                                                  : const Color.fromRGBO(
                                                      0, 0, 0, 1),
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            mission.description,
                                            style: TextStyle(
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                              color: isSelected
                                                  ? Colors.white
                                                  : const Color.fromRGBO(
                                                      0, 0, 0, 0.6),
                                            ),
                                            maxLines: null,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (viewModel.isSortOptionsVisible)
              Positioned(
                left: 12,
                right: 12,
                bottom: 34,
                child: Material(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 64,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color.fromRGBO(226, 226, 226, 1),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ListTile(
                          title: Text(
                            '인기순',
                            style: TextStyle(
                              color: viewModel.selectedSortOption == '인기순'
                                  ? Colors.black
                                  : const Color.fromRGBO(190, 190, 190, 1),
                              fontFamily: 'Pretendard',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            viewModel.selectSortOption('인기순');
                          },
                        ),
                        ListTile(
                          title: Text(
                            '최신순',
                            style: TextStyle(
                              color: viewModel.selectedSortOption == '최신순'
                                  ? Colors.black
                                  : const Color.fromRGBO(190, 190, 190, 1),
                              fontFamily: 'Pretendard',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            viewModel.selectSortOption('최신순');
                          },
                        ),
                        ListTile(
                          title: Text(
                            '오래된순',
                            style: TextStyle(
                              color: viewModel.selectedSortOption == '오래된순'
                                  ? Colors.black
                                  : const Color.fromRGBO(190, 190, 190, 1),
                              fontFamily: 'Pretendard',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            viewModel.selectSortOption('오래된순');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
