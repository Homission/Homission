import 'package:flutter/material.dart';

class AdminMissionDetailViewModel extends ChangeNotifier {
  bool isLoading = true;

  AdminMissionDetailViewModel() {
    _fetchMissionDetails();
  }

  Future<void> _fetchMissionDetails() async {
    await Future.delayed(const Duration(seconds: 2)); // 예시를 위한 딜레이
    isLoading = false;
    notifyListeners();
  }
}
