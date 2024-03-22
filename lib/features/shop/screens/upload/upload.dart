import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:freshly/features/shop/screens/home/home.dart';
import 'package:freshly/features/shop/screens/upload/storage_service.dart';
import 'package:freshly/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';

class UploadProduce extends StatefulWidget {
  const UploadProduce({super.key});

  @override
  State<UploadProduce> createState() => _UploadProduceState();
}

class _UploadProduceState extends State<UploadProduce> {
  Uint8List? _image;
  File? selectedIMage;
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(
        showBackArrow: true,
      ),
      backgroundColor: MColors.textWhite,
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text('Add New Produce', style: TextStyle(fontFamily: 'DM Serif', fontSize: 32, color: MColors.accentColor)),
              ),
              ElevatedButton(
                onPressed: () => showImagePickerOption(context),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<CircleBorder>(
                        const CircleBorder())),
                child: _image != null ? CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      MemoryImage(_image!),
                ) : const CircleAvatar(
                  radius: 100,
                  backgroundImage:
                  AssetImage('assets/images/upload/upload.png'),
                ),
              ),
              //SizedBox(height: 5),
              TextButton(
                onPressed: () => showImagePickerOption(context),
                child: const Center(
                  child: Text('Add one photo', style: TextStyle(fontFamily: 'DM Sans', fontSize: 22, color: MColors.dark)),
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwnSections),
              Form(
                child: Column(
                  children: [
                    /// Category
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                        expands: false,
                        decoration: const InputDecoration(labelText: 'Category', labelStyle: TextStyle())),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Title
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(labelText: 'Title')),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Type
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(labelText: 'Type')),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Quantity
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(labelText: 'Quantity')),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Description
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: SizedBox(
                        height: 60,
                        child: TextField(
                          minLines: 5,
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description',
                          ),
                          //keyboardType: TextInputType.text,
                          //style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Price
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(labelText: 'Price')),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnSections),

                    ///Upload Button
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: ElevatedButton(
                          onPressed: selectedIMage != null ? () async {
                            final path = selectedIMage!.path;
                            final fileName = path.split('/').last;

                            try {
                              final imageUrl = await storage.uploadFile(path, fileName);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload successful')));
                              
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen(imageUrl: imageUrl)));
                            } catch (e){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Upload failed: $e'),
                                ),
                              );
                            }
                          } : null,
                          child: const Text('Upload'),
                        ),
                      ),
                    ),
                    
                    FutureBuilder(
                        future: storage.listFiles(),
                        builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot){
                          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                            return Container(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.items.length,
                                itemBuilder: (BuildContext context, int index){
                                  return ElevatedButton(
                                    onPressed: (){},
                                    child: Text(snapshot.data!.items[index].name),
                                  );
                                },
                              ),
                            );
                          }
                          if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                            return CircularProgressIndicator();
                          }
                          return Container();
                      },
                    ),
                    FutureBuilder(
                        future: storage.downloadURL('1000000034.jpg'),
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 300, height: 250,
                                child: Image.network(snapshot.data!, fit: BoxFit.cover),
                              ),
                            );
                          }
                          if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                            return CircularProgressIndicator();
                          }
                          return Container();
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showImagePickerOption(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: MColors.textWhite,
        builder: (builder){
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/4.5,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
                  _pickImageFromGallery();
                },
                child: const SizedBox(
                  child: Column(
                    children: [
                      Icon(Icons.image, size: 70), Text('Gallery'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  _pickImageFromCamera();
                },
                child: const SizedBox(
                  child: Column(
                    children: [
                      Icon(Icons.camera_alt_outlined, size: 70), Text('Camera'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  //Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  //Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
