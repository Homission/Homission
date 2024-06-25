import 'package:flutter/material.dart';
import 'package:homission/Presentation/Mission/InProgressMission/in_progress_screen.dart';
import 'package:homission/Presentation/Mission/InProgressMission/in_progress_screen_viewmodel.dart';
import 'CompletedMission/completed_screen.dart';
import 'CompletedMission/completed_screen_viewmodel.dart';
import 'BrowseMission/browse_screen.dart';
import 'BrowseMission/browse_screen_viewmodel.dart';
import 'custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'mission_screen_viewmodel.dart';
import 'package:homission/Presentation/Mission/Repository/mission_repository.dart';
import 'package:homission/Presentation/Mission/Repository/firebase_mission_repository.dart';
import 'package:homission/Presentation/Mission/Usecase/MissionDetailUseCaseImpl.dart';
import 'package:homission/Presentation/Mission/Usecase/MissionDetailUseCase.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  _MissionScreenState createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late MissionScreenViewModel missionScreenViewModel;
  late MissionDetailUseCase missionDetailUseCase;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    final inProgressViewModel = InProgressScreenViewModel();
    final completedViewModel = CompletedScreenViewModel();
    final browseViewModel = BrowseScreenViewModel();
    final MissionRepository missionRepository = FirebaseMissionRepository();
    missionDetailUseCase = MissionDetailUseCaseImpl(missionRepository);

    missionScreenViewModel = MissionScreenViewModel(
      inProgressViewModel: inProgressViewModel,
      completedViewModel: completedViewModel,
      browseViewModel: browseViewModel,
      missionRepository: missionRepository,
    );

    missionScreenViewModel.fetchAllData('userID_123');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => missionScreenViewModel.inProgressViewModel),
        ChangeNotifierProvider(
            create: (_) => missionScreenViewModel.completedViewModel),
        ChangeNotifierProvider(
            create: (_) => missionScreenViewModel.browseViewModel),
        ChangeNotifierProvider(create: (_) => missionScreenViewModel),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: CustomAppBar(),
          body: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: const Color.fromRGBO(18, 18, 18, 1),
                  unselectedLabelColor: const Color.fromRGBO(227, 227, 227, 1),
                  labelStyle: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  tabs: const [
                    Tab(text: '진행중'),
                    Tab(text: '완료'),
                    Tab(text: '둘러보기'),
                  ],
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2.0,
                      ),
                    ),
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    InProgressScreen(
                      userId: 'userID_123',
                      missionDetailUseCase: missionDetailUseCase,
                    ),
                    CompletedScreen(
                      userId: 'userID_123',
                      missionDetailUseCase: missionDetailUseCase,
                    ),
                    BrowseScreen(
                      userId: 'userID_123',
                      missionDetailUseCase: missionDetailUseCase,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
