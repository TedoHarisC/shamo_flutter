import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/model/product_model.dart';
import 'package:shamo/model/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addMessage(
      {required UserModel user,
      required bool isFromUser,
      required String message,
      required ProductModel product}) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': true,
        'message': message,
        'product': product is UninitializedProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
        // ignore: avoid_print
      }).then((value) => print('Pesan berhasil Dikirim!'));
    } catch (e) {
      throw Exception();
    }
  }
}
