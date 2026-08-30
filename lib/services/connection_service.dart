import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConnectionService {
  static final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  static final FirebaseAuth _auth =
      FirebaseAuth.instance;

  static Future<void> sendConnectionRequest({
    required String localName,
    required String destination,
    required String placeName,
  }) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('You must be logged in to connect with a local.');
    }

    await _firestore.collection('connections').add({
      'travellerId': user.uid,
      'travellerEmail': user.email,
      'localName': localName,
      'destination': destination,
      'placeName': placeName,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}