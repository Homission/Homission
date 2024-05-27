import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 96,
          height: 28,
          child: Image.asset(
            'asset_mission/image_mission/mission_logo.png', // 로고 이미지 경로 설정
            fit: BoxFit.fitWidth, // 가로 너비에 맞추고 세로 비율 유지
          ),
        ),
      ),
      leadingWidth: 96,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // 검색 버튼 동작
          },
        ),
      ],
    );
  }
}
