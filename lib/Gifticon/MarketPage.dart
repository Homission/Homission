import 'package:flutter/material.dart';
import 'package:homission/Gifticon/GifticonStorage.dart';
import 'package:homission/Gifticon/ProductCard.dart';
import 'package:homission/Gifticon/ProductDetailPage.dart';
import 'package:homission/Gifticon/Gifticon.dart';

class MarketPage extends StatelessWidget {
  final List<Gifticon> mockGiftDataList = [
    Gifticon(
      image: 'assets/gifticonSample1.png',
      wish: false,
      name: '신라면 (작은 컵)',
      point: 2000,
      contributorName: '기부천사',
      contributorDescription:
      '친구한테 선물로 받았는데, 받고 집 근처에 GS 편의점이 없어서 기부합니다! 맛있게 드세요 :)',
    ),
    Gifticon(
      image: 'assets/gifticonSample2.png',
      wish: false,
      name: '콜라',
      point: 1000,
      contributorName: '기부천사',
      contributorDescription:
      '친구한테 선물로 받았는데, 받고 집 근처에 GS 편의점이 없어서 기부합니다! 맛있게 드세요 :)',
    ),
    Gifticon(
      image: 'assets/gifticonSample2.png',
      wish: false,
      name: '콜라',
      point: 1000,
      contributorName: '기부천사',
      contributorDescription:
      '친구한테 선물로 받았는데, 받고 집 근처에 GS 편의점이 없어서 기부합니다! 맛있게 드세요 :)',
    ),
    Gifticon(
      image: 'assets/gifticonSample2.png',
      wish: false,
      name: '콜라',
      point: 1000,
      contributorName: '기부천사',
      contributorDescription:
      '친구한테 선물로 받았는데, 받고 집 근처에 GS 편의점이 없어서 기부합니다! 맛있게 드세요 :)',
    ),
    Gifticon(
      image: 'assets/gifticonSample2.png',
      wish: false,
      name: '콜라',
      point: 1000,
      contributorName: '기부천사',
      contributorDescription:
      '친구한테 선물로 받았는데, 받고 집 근처에 GS 편의점이 없어서 기부합니다! 맛있게 드세요 :)',
    ),
    Gifticon(
      image: 'assets/gifticonSample2.png',
      wish: false,
      name: '콜라',
      point: 1000,
      contributorName: '기부천사',
      contributorDescription:
      '친구한테 선물로 받았는데, 받고 집 근처에 GS 편의점이 없어서 기부합니다! 맛있게 드세요 :)',
    ),
    Gifticon(
      image: 'assets/gifticonSample2.png',
      wish: false,
      name: '콜라',
      point: 1000,
      contributorName: '기부천사',
      contributorDescription:
      '친구한테 선물로 받았는데, 받고 집 근처에 GS 편의점이 없어서 기부합니다! 맛있게 드세요 :)',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/homeImage.png',
              fit: BoxFit.fitWidth),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border, color: Colors.black)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GifticonStorage(gifticons: [mockGiftDataList[0]], onTap: (){})));
              },
              icon: Icon(Icons.notifications_none, color: Colors.black))
        ],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(''),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(0.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 1 / 1.5,
        ),
        itemCount: mockGiftDataList.length,
        itemBuilder: (context, index) {
          final giftData = mockGiftDataList[index];
          return ProductCard(
              gifticon: giftData,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(gifticon: giftData)));
              });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: '우리집',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag, color: Colors.black),
            label: '미션',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.black),
            label: '마켓',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: '마이페이지',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
}
