import 'package:fruit_hub/core/services/data_base_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices implements DataBaseServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      required String? uid}) async {
    if (uid != null) {
      await _firestore.collection(path).doc(uid).set(data);
    } else {
      await _firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {required String path, String? uid, Map<String, dynamic>? query}) async {
    if (uid != null) {
      return (await _firestore.collection(path).doc(uid).get()).data()!;
    } else {
      Query<Map<String, dynamic>> data =  _firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderBy = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderBy, descending: descending);
        }

        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> isDataExist({required String path, required String uid}) async {
    var data = await _firestore.collection(path).doc(uid).get();
    return data.exists;
  }
}
