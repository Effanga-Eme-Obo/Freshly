import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freshly/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  bool _passwordVisible = false;
  Uint8List? _image;
  File? selectedIMage;
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
                child: Text('Edit Profile', style: TextStyle(fontFamily: 'DM Serif', fontSize: 30, color: MColors.accentColor)),
              ),
              ElevatedButton(
                onPressed: () {
                  showImagePickerOption(context);
                },
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
                onPressed: () {
                  showImagePickerOption(context);
                },
                child: const Center(
                  child: Text('Update Photo', style: TextStyle(fontSize: 20, color: MColors.textSecondary, decoration: TextDecoration.underline, decorationColor: MColors.textSecondary)),
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwnSections),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Personal Details
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 8.0),
                      child: Text('PERSONAL DETAILS', style: TextStyle(color: MColors.darkGrey)),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnItems),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                        expands: false,
                        decoration: const InputDecoration(labelText: 'First Name', labelStyle: TextStyle())),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Last Name
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(labelText: 'Last Name')),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Phone Number
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(labelText: 'Phone Number'),
                        ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// E-mail
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(labelText: 'Email')),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Town
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(labelText: 'Town')),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    /// Location
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                          expands: false,
                          decoration: const InputDecoration(labelText: 'Location')),
                    ),
                    const SizedBox(height: MSizes.spaceBtwnInputFields),

                    ///Update Button
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: ElevatedButton(
                          onPressed: (){
                            Alert(
                              context: context,
                              title: 'Input password to continue',
                              content: Container(
                                width: double.maxFinite,
                                child: Column(
                                  children: [
                                    SizedBox(height: MSizes.spaceBtwnItems),
                                    TextFormField(
                                      obscureText: !_passwordVisible,
                                      decoration: InputDecoration(
                                          labelText: Mtexts.password,
                                          prefixIcon: Icon(Iconsax.password_check),
                                          suffixIcon: IconButton(
                                            icon: Icon(_passwordVisible ? Iconsax.eye : Iconsax.eye_slash),
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible = !_passwordVisible;
                                              });
                                            },
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              type: AlertType.warning,
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    Alert(
                                        context: context,
                                        type: AlertType.success,
                                        title: 'Account Successfully Updated',
                                        buttons: [
                                          DialogButton(
                                              child: const Text('OK', style: TextStyle(fontFamily: 'DM Sans', fontSize: 20)),
                                              onPressed: () => Navigator.pop(context),
                                          )
                                        ],
                                    ).show();
                                  },
                                  color: MColors.success,
                                  child: const Text('Continue', style: TextStyle(fontFamily: 'DM Sans', fontSize: 20)),
                                ),
                              ],
                            ).show();
                          },
                          child: const Text('Update Account'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
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
