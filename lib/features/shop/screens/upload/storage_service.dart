import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> uploadFile(
      String filePath,
      String fileName
      ) async {
    File file = File(filePath);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child('test/$fileName');
    await ref.putFile(file);
    return await ref.getDownloadURL();

  }

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref('test').listAll();
    
    results.items.forEach((firebase_storage.Reference ref) { print('Found file: $ref');});
    return results;
  }

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref('test/$imageName').getDownloadURL();

    return downloadURL;
  }
}
