import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage({required Uint8List file, uid}) async {
    Reference ref = _storage.ref().child("profileImages").child(uid);
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    UploadTask uploadTask = ref.putData(file, metadata);
    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();
    log(imageUrl);
    return imageUrl;
  }
}
