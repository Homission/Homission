import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'in_progress_screen_viewmodel.dart';
import '../detail_screen.dart';

class InProgressScreen extends StatefulWidget {
  @override
  _InProgressScreenState createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  late InProgressScreenViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<InProgressScreenViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: InProgressScreenContent(),
    );
  }
}

class InProgressScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<InProgressScreenViewModel>(context);

    return ListView.builder(
      itemCount: viewModel.missions.length,
      itemBuilder: (context, index) {
        final mission = viewModel.missions[index];
        final isSelected = viewModel.selectedIndex == index;
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: index == 0 ? 16.0 : 10.0,
            bottom: index == viewModel.missions.length - 1 ? 16.0 : 0.0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: () {
                viewModel.selectMission(index);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MissionDetailScreen(),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      title: Text(
                        mission.title,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color.fromRGBO(0, 0, 0, 1),
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
                              : const Color.fromRGBO(73, 156, 255, 1),
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
                                    ? const Color.fromRGBO(73, 156, 255, 1)
                                    : Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${mission.rewardPoints}P',
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color.fromRGBO(73, 156, 255, 1)
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
