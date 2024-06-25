import 'package:flutter/material.dart';
import 'package:homission/Presentation/Mission/Model/Mission.dart';

class BrowseScreenViewModel extends ChangeNotifier {
  TabController? tabController;
  bool isChecked = false;
  int? selectedIndex;
  String selectedSortOption = '인기순';
  bool isSortOptionsVisible = false;

  List<Mission> missions = [
    // Mission(
    //   missionID: 1,
    //   title: '온라인 구직신청',
    //   rewardPoints: 100,
    //   description:
    //       '첫번째, 서울노숙인일자리지원센터에 방문해주세요! 두번째, ‘온라인 구직신청’을 완료해주세요. 세번째, 신청 완료된 화면을 캡쳐하여 호미션에 업로드해주시면 돼요!',
    //   participants: '1,201명',
    //   category: '구직',
    //   missionImage: 'path_to_image_1',
    // ),
    // Mission(
    //   missionID: 2,
    //   title: '미션 2',
    //   rewardPoints: 200,
    //   description: '이것은 미션 2에 대한 설명입니다.',
    //   participants: '2,345명',
    //   category: '건강',
    //   missionImage: 'path_to_image_2',
    // ),
    // Mission(
    //   missionID: 3,
    //   title: '미션 3',
    //   rewardPoints: 300,
    //   description: '이것은 미션 3에 대한 설명입니다.',
    //   participants: '567명',
    //   category: '교육',
    //   missionImage: 'path_to_image_3',
    // ),
    // Mission(
    //   missionID: 4,
    //   title: '미션 4',
    //   rewardPoints: 400,
    //   description: '이것은 미션 4에 대한 설명입니다.',
    //   participants: '3,789명',
    //   category: '마음',
    //   missionImage: 'path_to_image_4',
    // ),
    // Mission(
    //   missionID: 5,
    //   title: '미션 5',
    //   rewardPoints: 500,
    //   description: '이것은 미션 5에 대한 설명입니다.',
    //   participants: '1,234명',
    //   category: '구직',
    //   missionImage: 'path_to_image_5',
    // ),
  ];

  void initialize(TickerProvider tickerProvider) {
    tabController = TabController(length: 5, vsync: tickerProvider);
    tabController!.addListener(() {
      notifyListeners();
    });
  }

  void disposeController() {
    tabController?.dispose();
  }

  void toggleCheck() {
    isChecked = !isChecked;
    notifyListeners();
  }

  void toggleSortOptions() {
    isSortOptionsVisible = !isSortOptionsVisible;
    notifyListeners();
  }

  void selectSortOption(String option) {
    selectedSortOption = option;
    isSortOptionsVisible = false;
    notifyListeners();
  }

  void selectMission(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
