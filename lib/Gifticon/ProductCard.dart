import 'package:flutter/material.dart';
import 'package:homission/Gifticon/Gifticon.dart';

class ProductCard extends StatelessWidget {
  final Gifticon gifticon;
  final VoidCallback onTap;

  ProductCard({required this.gifticon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double width = constraints.maxWidth;
                return Image.asset(
                  gifticon.image,
                  width: width,
                  height: width,
                  fit: BoxFit.fill,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 12.0),
              child: Text(
                gifticon.name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 2.0),
              child: Text(
                '${gifticon.point}p',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 2.0),
              child: Text(
                '${gifticon.contributorName}님 제공',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}