import 'package:firebase_database/firebase_database.dart';
import 'package:homission/Gifticon/Gifticon.dart';

class DatabaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('homissionsheet');

  Future<List<Gifticon>> fetchGifticons() async {
    List<Gifticon> gifticonList = [];
    try {
      DataSnapshot snapshot = await _dbRef.get();
      if (snapshot.value != null) {
        Map<String, dynamic> values = Map<String, dynamic>.from(snapshot.value as Map);
        values.forEach((key, value) {
          gifticonList.add(Gifticon.fromJson(Map<String, dynamic>.from(value)));
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return gifticonList;
  }
}