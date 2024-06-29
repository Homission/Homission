import 'package:flutter/material.dart';
import 'package:homission/Gifticon/Gifticon.dart';
import 'package:homission/Gifticon/ProductCard.dart';

class GifticonStorage extends StatelessWidget {
  final List<Gifticon> gifticons;
  final VoidCallback onTap;
  final String title; // 제목을 주입받을 수 있도록 추가

  GifticonStorage({
    required this.gifticons,
    required this.onTap,
    required this.title, // 제목을 생성자에 추가
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(title), // 주입받은 제목을 사용
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 1 / 1.5,
        ),
        itemCount: gifticons.length,
        itemBuilder: (context, index) {
          return ProductCard(
            gifticon: gifticons[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}
