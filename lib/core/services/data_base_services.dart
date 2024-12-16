
abstract class DataBaseServices {
  Future<void> addData({required String path, required Map<String, dynamic> data , required String? uid});
  Future< dynamic> getData({required String path,  String? uid , Map<String, dynamic>? query});
  Future<bool> isDataExist({required String path, required String uid});
}