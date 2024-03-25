import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData{
 static Future<String> uploadImageToStorage(String childName, XFile file) async {
    
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putFile(File(file.path));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

static  Future<String> uploadProduce({required String category, required String title, required String quantity, required String description, required double price, required  XFile file}) async {
   final user = FirebaseAuth.instance.currentUser;
   try {
      String pid = Uuid().v4();//d85b55f0-18da-4eae-9e4b-16e04ff3c747

     String image = await uploadImageToStorage(pid, file);
   await _firestore.collection('Product').doc(pid).set({
      'pid':pid,
      'id':user?.uid,
      'category': category,
      'title':title,
      'quantity':quantity,
      'description':description,
      'price':price,
      'image': image
    });
    print('SUCESSSFUL+____------------------------------------------');
    }
        catch(error){
          throw Exception(error);
        }
        return '';
  }
}