import 'package:flutter/material.dart';
import 'package:homission/Gifticon/GifticonStorage.dart';
import 'package:homission/Gifticon/ProductCard.dart';
import 'package:homission/Gifticon/ProductDetailPage.dart';
import 'package:homission/Gifticon/Gifticon.dart';

class MarketPage extends StatelessWidget {
  final List<Gifticon> mockGiftDataList = [
    Gifticon(
      image: 'assets/images/gifticon/sample1.jpeg',
      wish: false,
      name: '빙그레)바나나우유240ML',
      point: 1800,
      contributorName: '기부천사',
      contributorDescription:
      '친구한테 선물로 받았는데, 받고 집 근처에 GS 편의점이 없어서 기부합니다! 맛있게 드세요 :)',
    ),
    Gifticon(
      image: 'assets/images/gifticon/sample2.png',
      wish: false,
      name: '롯데)펩시콜라캔250ML',
      point: 1600,
      contributorName: '예톤',
      contributorDescription:
      '콜라를 안먹어서 기부합니다 맛있게 드세요~',
    ),
    Gifticon(
      image: 'assets/images/gifticon/sample3.png',
      wish: false,
      name: '동아)포카리스웨트캔240ML',
      point: 1600,
      contributorName: 'eigen406',
      contributorDescription:
      '올 여름 시원하게 보내세요 :)',
    ),
    Gifticon(
      image: 'assets/images/gifticon/sample4.png',
      wish: false,
      name: 'CU 모바일 상품권 5000원',
      point: 5000,
      contributorName: 'yann',
      contributorDescription:
      'CU가 집근처에 없어 기부합니다~ ',
    ),
    Gifticon(
      image: 'assets/images/gifticon/sample5.png',
      wish: false,
      name: '누드 빼빼로',
      point: 1800,
      contributorName: '혜원',
      contributorDescription:
      '누드 빼빼로 맛있게 드세요!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 96,
            height: 28,
            child: Image.asset(
              'asset_mission/image_mission/mission_logo.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GifticonStorage(gifticons: [mockGiftDataList[1]], onTap: (){}, title: '찜 내역',)));
              },
              icon: Icon(Icons.favorite_border, color: Colors.black)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GifticonStorage(gifticons: [mockGiftDataList[0]], onTap: (){}, title: '구매 내역',)));
              },
              icon: ImageIcon(
                AssetImage('assets/images/gifticon/cartImage.png'), // 이미지 경로를 실제 경로로 변경
                size: 44.0,
                color: Colors.black,
              ))
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
    );
  }
}
