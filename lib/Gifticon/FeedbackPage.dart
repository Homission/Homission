import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _controller = TextEditingController();
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final isButtonActive = _controller.text.isNotEmpty;
      setState(() {
        _isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double feedbackBoxHeight = screenHeight / 2;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "호미션에 원하는 상품이 없나요?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "지금 마켓에 원하는 상품이 없다면 알려주세요.",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            Text(
              "최대한 빠르게 구비해둘게요!",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 16),
            Container(
              height: feedbackBoxHeight,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "호미션에게 의견을 남겨주세요!",
                  border: InputBorder.none,
                ),
                maxLines: null,
                expands: true,
              ),
            ),
            SizedBox(height: 100),
            Container(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isButtonActive
                    ? () {
                  Navigator.pop(context);
                }
                    : null,
                child: Text("보내기"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // 코너 반경을 20으로 설정
                  ),
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                  foregroundColor: Colors.white,
                  backgroundColor:_isButtonActive ? Colors.lightBlue : Colors.lightBlue.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}