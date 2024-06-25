import 'package:flutter/material.dart';


class AdminMissionViewModel extends ChangeNotifier {
  String centerName = "다시서기센터";
  int approvalNeededMissions = 3;
  bool isLoading = false;
  bool isChecked = false;
  String selectedSortOption = '인기순';

  // 데이터를 불러오는 메서드
  Future<void> fetchAdminData() async {
    isLoading = true;
    notifyListeners();

    // 실제 데이터를 불러오는 로직 추가
    await Future.delayed(Duration(seconds: 2)); // 예시를 위한 딜레이

    isLoading = false;
    notifyListeners();
  }

  void toggleCheck() {
    isChecked = !isChecked;
    notifyListeners();
  }

  void toggleSortOptions() {
    // Sort options toggle logic
    notifyListeners();
  }

  void selectSortOption(String option) {
    selectedSortOption = option;
    notifyListeners();
  }
}
