import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:homission/Gifticon/GifticonStorage.dart';
import 'package:homission/Gifticon/ProductCard.dart';
import 'package:homission/Gifticon/ProductDetailPage.dart';
import 'package:homission/Gifticon/FeedbackPage.dart';
import 'package:homission/Gifticon/Gifticon.dart';
import 'package:homission/Gifticon/DatabaseService.dart'; // 데이터베이스 서비스 경로에 맞게 수정

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  List<Gifticon> _gifticonList = [];

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  void _fetchData() async {
    DatabaseService dbService = DatabaseService();
    List<Gifticon> data = await dbService.fetchGifticons();
    setState(() {
      _gifticonList = data;
    });
  }

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
              onPressed: () {},
              icon: Icon(Icons.favorite_border, color: Colors.black)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GifticonStorage(gifticons: [if (_gifticonList.isNotEmpty) _gifticonList[0]], onTap: (){})));
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
      body: _gifticonList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: EdgeInsets.all(0.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 1 / 1.5,
        ),
        itemCount: _gifticonList.length,
        itemBuilder: (context, index) {
          final giftData = _gifticonList[index];
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FeedbackPage()));
        },
        child: Image.asset(
          'assets/images/gifticon/message.png',
          fit: BoxFit.fitWidth,
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}