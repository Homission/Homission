import 'package:flutter/material.dart';
import 'package:homission/Gifticon/Gifticon.dart';

class ProductCard extends StatefulWidget {
  final Gifticon gifticon;
  final VoidCallback onTap;

  ProductCard({required this.gifticon, required this.onTap});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;
                    return Image.asset(
                      widget.gifticon.image,
                      width: width,
                      height: width,
                      fit: BoxFit.fill,
                    );
                  },
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Image.asset(
                      isFavorite
                          ? 'assets/images/gifticon/heart_fill.png'
                          : 'assets/images/gifticon/heart.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 12.0),
              child: Text(
                widget.gifticon.name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 2.0),
              child: Text(
                '${widget.gifticon.point}p',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 2.0, bottom: 16.0),
              child: Text(
                '${widget.gifticon.contributorName}님 제공',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
