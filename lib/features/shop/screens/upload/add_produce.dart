import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freshly/common/widgets/appbar/appbar.dart';
import 'package:freshly/navbar.dart';
import 'package:freshly/resources/add_data.dart';
import 'package:freshly/utils/constants/colors.dart';
import 'package:freshly/utils/constants/sizes.dart';
import 'package:freshly/utils/imagepicker/image_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/formatters/thousands_seperator.dart';

class AddProduce extends StatefulWidget {
  const AddProduce({super.key});

  @override
  State<AddProduce> createState() => _AddProduceState();
}

class _AddProduceState extends State<AddProduce> {
  XFile? _image;
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  void selectImage() async {
    XFile img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void uploadProduce() {
    if (_image == null) return;
    StoreData.uploadProduce(
      category: categoryController.text,
      title: titleController.text.trim(),
      quantity: quantityController.text.trim(),
      description: descriptionController.text.trim(),
      price: double.parse(priceController.text.trim()),
      file: _image!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(
        showBackArrow: false,
        title: Center(
          child: Text('Add New Produce', style: TextStyle(fontFamily: 'DM Serif', fontSize: 30, fontWeight: FontWeight.normal)),
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                  onPressed: selectImage,
                  child: _image != null
                      ? CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(File(_image!.path)))
                      : const CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage('assets/images/upload/upload.png'),
                        )),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Add one photo',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 22,
                    color: MColors.accentColor,
                  ),
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
                        controller: categoryController,
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: 'Category', labelStyle: TextStyle()),
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Title
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                        controller: titleController,
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: 'Title', labelStyle: TextStyle()),
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Quantity
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                        controller: quantityController,
                        //keyboardType: TextInputType.number,
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: 'Quantity', labelStyle: TextStyle()),
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Description
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                        controller: descriptionController,
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: 'Description', labelStyle: TextStyle()),
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Price
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [ThousandsSeparatorInputFormatter()],
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: 'Price', labelStyle: TextStyle()),
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Price
                    /*Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: TextFormField(
                            expands: false,
                            decoration: InputDecoration(
                              labelText: 'Unit Price',
                               labelStyle: TextStyle(),
                              //prefixIcon: Image.asset('assets/images/upload/naira16.ico'),
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            ),
                          ),
                      ),
                      const SizedBox(height: MSizes.spaceBtwnInputFields),*/

                    /// Upload
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            uploadProduce();
                            Get.to(const NavBar());
                            },
                          child: const Text('Upload'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


