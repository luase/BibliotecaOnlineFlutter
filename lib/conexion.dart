// import 'package:cloud_firestore/cloud_firestore.dart';

// class ConexionFirebase {
//   final Firestore _db = Firestore.instance;
//   Future<void> getLoans ({String nua}) async{
//     print(nua);
//     DocumentSnapshot document;
//     document = await _db.collection('loans').document(nua).get();
//     print(document.data);
//   }

// }