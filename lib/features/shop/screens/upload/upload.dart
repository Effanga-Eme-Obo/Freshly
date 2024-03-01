import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freshly/features/shop/screens/home/home.dart';
import 'package:freshly/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        showBackArrow: true,
      ),
      backgroundColor: MColors.textWhite,
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text('Add New Produce', style: TextStyle(fontFamily: 'DM Serif', fontSize: 32, color: MColors.accentColor)),
              ),
              ElevatedButton(
                onPressed: () {
                  showImagePickerOption(context);
                },
                child: _image != null ? CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      MemoryImage(_image!),
                ) : CircleAvatar(
                  radius: 100,
                  backgroundImage:
                  AssetImage('assets/images/upload/upload.png'),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder())),
              ),
              //SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  showImagePickerOption(context);
                },
                child: Center(
                  child: Text('Add one photo', style: TextStyle(fontFamily: 'DM Sans', fontSize: 22, color: MColors.dark)),
                ),
              ),
              Text('supported formats are jpg,'),
              Text('gif and png'),
              SizedBox(height: MSizes.spaceBtwnSections),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Container(
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
                          onPressed: () => Get.to(() => HomeScreen()),
                          child: const Text('Upload'),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
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
                child: SizedBox(
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
                child: SizedBox(
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
