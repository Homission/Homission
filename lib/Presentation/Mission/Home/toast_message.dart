import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToastMessage {
  static void show(BuildContext context, String message) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(72, 156, 255, 0.16),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '집 완성까지 1단계 남았어요!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(27, 27, 27, 1),
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/vector.svg',
                    semanticsLabel: 'vector',
                    width: 16,
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(overlayEntry);

    Future.delayed(Duration(seconds: 4), () {
      overlayEntry.remove();
    });
  }
}
