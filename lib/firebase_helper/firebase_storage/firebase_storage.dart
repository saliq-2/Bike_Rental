import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
class firebase_storage
{
  static firebase_storage instance=firebase_storage();
  final FirebaseStorage _storage=FirebaseStorage.instance;
  Future<String> uploadUserImage(File image) async{
    String userId=FirebaseAuth.instance.currentUser!.uid;
    TaskSnapshot taskSnapshot = await _storage.ref(userId).putFile(image);
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;



  }
}
