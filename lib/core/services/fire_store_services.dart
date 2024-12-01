import 'package:fruit_hub/core/services/data_base_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FireStoreServices implements DataBaseServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data})async {
    await _firestore.collection(path).add(data);
  } 

}

