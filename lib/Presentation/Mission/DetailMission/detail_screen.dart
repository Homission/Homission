import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../custom_app_bar.dart';
import 'package:homission/Presentation/Mission/mission_certification_screen.dart';
import 'package:homission/Presentation/Mission/DetailMission/detail_screen_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:homission/Presentation/Mission/Usecase/MissionDetailUseCase.dart';

class MissionDetailScreen extends StatelessWidget {
  final String userId;
  final int missionId;
  final MissionDetailUseCase missionDetailUseCase;

  const MissionDetailScreen({
    required this.userId,
    required this.missionId,
    required this.missionDetailUseCase,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MissionDetailViewModel>(
      future: missionDetailUseCase.getMissionDetails(userId, missionId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: CustomAppBar(),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: CustomAppBar(),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          final viewModel = snapshot.data!;
          return ChangeNotifierProvider<MissionDetailViewModel>.value(
            value: viewModel,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: CustomAppBar(),
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(height: 32), // 상단 앱바와의 여백
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<MissionDetailViewModel>(
                              builder: (context, viewModel, child) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(208, 230, 255, 1),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    viewModel.missionStatus ==
                                            MissionStatus.inProgress
                                        ? '참여중'
                                        : viewModel.missionStatus ==
                                                MissionStatus.completed
                                            ? '완료'
                                            : '참여가능',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(72, 156, 255, 1),
                                      fontFamily: 'Pretendard',
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Consumer<MissionDetailViewModel>(
                              builder: (context, viewModel, child) {
                                return Text(
                                  '현재 ${viewModel.participantsCount}명 참여',
                                  style: const TextStyle(
                                    color: Color.fromRGBO(135, 135, 135, 1),
                                    fontFamily: 'Pretendard',
                                    fontSize: 12,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Consumer<MissionDetailViewModel>(
                          builder: (context, viewModel, child) {
                            return Text(
                              viewModel.title,
                              style: const TextStyle(
                                color: Color.fromRGBO(17, 17, 17, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Consumer<MissionDetailViewModel>(
                          builder: (context, viewModel, child) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(208, 230, 255, 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft, // 왼쪽 정렬
                                    child: FractionallySizedBox(
                                      widthFactor: viewModel.completionRate,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              72, 156, 255, 1),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '완료율 ${(viewModel.completionRate * 100).toStringAsFixed(0)}%',
                                  style: const TextStyle(
                                    color: Color.fromRGBO(72, 156, 255, 1),
                                    fontFamily: 'Pretendard',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        Consumer<MissionDetailViewModel>(
                          builder: (context, viewModel, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'asset_mission/image_mission/material-symbols_rewarded-ads-outline.svg',
                                      width: 20,
                                      height: 20,
                                      color:
                                          const Color.fromRGBO(92, 92, 92, 1),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      '보상',
                                      style: TextStyle(
                                        color: Color.fromRGBO(92, 92, 92, 1),
                                        fontFamily: 'Pretendard',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${viewModel.rewardPoints}P',
                                  style: const TextStyle(
                                    color: Color.fromRGBO(92, 92, 92, 1),
                                    fontFamily: 'Pretendard',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        Consumer<MissionDetailViewModel>(
                          builder: (context, viewModel, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'asset_mission/image_mission/material-symbols_category-outline-rounded.svg',
                                      width: 20,
                                      height: 20,
                                      color:
                                          const Color.fromRGBO(92, 92, 92, 1),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      '카테고리',
                                      style: TextStyle(
                                        color: Color.fromRGBO(92, 92, 92, 1),
                                        fontFamily: 'Pretendard',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  viewModel.category,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(92, 92, 92, 1),
                                    fontFamily: 'Pretendard',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        Container(
                          width: double.infinity,
                          height: 8,
                          color: const Color.fromRGBO(245, 245, 245, 1),
                        ),
                        const SizedBox(height: 24),
                        Consumer<MissionDetailViewModel>(
                          builder: (context, viewModel, child) {
                            return Text(
                              viewModel.description,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Color.fromRGBO(17, 17, 17, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 14,
                                height: 1.5,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 16,
                    right: 16,
                    child: Consumer<MissionDetailViewModel>(
                      builder: (context, viewModel, child) {
                        return SizedBox(
                          width: double.infinity,
                          height: 58, // 버튼 높이 58로 설정
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: viewModel.isParticipating
                                  ? const Color.fromRGBO(17, 17, 17, 1)
                                  : const Color.fromRGBO(72, 156, 255, 1),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              viewModel.toggleParticipation();
                              if (viewModel.isParticipating) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CertificationScreen()),
                                );
                              }
                            },
                            child: Text(
                              viewModel.isParticipating ? '인증하기' : '참여하기',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Pretendard',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
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
          );
        }
      },
    );
  }
}
