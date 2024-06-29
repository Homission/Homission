import 'package:flutter/material.dart';
import 'package:homission/Gifticon/Gifticon.dart';

class ReportPage extends StatefulWidget {
  final Gifticon gifticon;

  ReportPage({required this.gifticon});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  String reportText = '';

  bool get isButtonEnabled {
    return isChecked1 || isChecked2 || isChecked3 || reportText.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('신고'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '신고 상품',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(widget.gifticon.image), // Gifticon 이미지를 사용
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.gifticon.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${widget.gifticon.point}P',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${widget.gifticon.contributorName}님 제공',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              '어떤 이유로 신고하시나요?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('잘못된 상품이에요'),
              value: isChecked1,
              onChanged: (bool? value) {
                setState(() {
                  isChecked1 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('가격, 수량 등 실제 상품 정보와 달라요'),
              value: isChecked2,
              onChanged: (bool? value) {
                setState(() {
                  isChecked2 = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('사용 가능 기한이 초과됐어요'),
              value: isChecked3,
              onChanged: (bool? value) {
                setState(() {
                  isChecked3 = value!;
                });
              },
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '신고 내용을 작성해주세요',
                filled: true,
                fillColor: const Color(0xFFF6F6F6),
                contentPadding: const EdgeInsets.all(16),
              ),
              maxLines: 5,
              onChanged: (text) {
                setState(() {
                  reportText = text;
                });
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('신고가 완료됐습니다.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: isButtonEnabled ? Colors.black : Colors.grey,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 16,
                  ),
                ),
                child: const Text('신고하기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
