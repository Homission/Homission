import 'package:flutter/material.dart';
import 'package:homission/Gifticon/Gifticon.dart';
import 'package:homission/Gifticon/ProductCard.dart';

class GifticonStorage extends StatelessWidget {
  final List<Gifticon> gifticons;
  final VoidCallback onTap;

  GifticonStorage({required this.gifticons, required this.onTap});

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
        title: Text('구매 내역'),
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
          return ProductCard(gifticon: gifticons[index]
              , onTap: () {

              });
        },
      ),
    );
  }
}