import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:freshly/common/widgets/appbar/appbar.dart';
import 'package:freshly/features/shop/screens/upload/add_produce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:freshly/resources/add_data.dart';
import 'package:intl/intl.dart';
import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  final String imageUrl;

  HomeScreen({Key? key, required this.imageUrl}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 450,
              //color: MColors.primaryColor,
              decoration: const BoxDecoration(
                //borderRadius: BorderRadius.circular(30),
                color: MColors.primaryColor,
              ),
            ),
          ),
          Positioned(
              top: -150,
              right: -200,
              child: MCircularContainer(
                  bgColor: MColors.textWhite.withOpacity(0.1))),
          Positioned(
              top: 100,
              right: -300,
              child: MCircularContainer(
                  bgColor: MColors.textWhite.withOpacity(0.1))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MAppBar(),
              //const SizedBox(height: MSizes.spaceBtwnSections),
              const Padding(
                padding: EdgeInsets.only(left: 30.0, top: 8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/images/upload/profile_again.png'),
                ),
              ),
              const SizedBox(height: 9.0),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text('Hello, ${user?.displayName}👋🏾',
                    style: const TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        color: MColors.textWhite)),
              ),
              //SizedBox(height: 5.0),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text('What are we selling today?',
                    style: TextStyle(color: MColors.textWhite, fontSize: 15.5)),
              )
            ],
          ),
          Positioned(
            top: 320,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: dark ? MColors.dark : MColors.lightGrey,
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Product')
                      .where('id', isEqualTo: user?.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    List products = snapshot.data!.docs;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, top: MSizes.defaultSpace - 10),
                          child: Text('Your Produce',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 20,
                                  color:
                                      dark ? MColors.textWhite : MColors.dark)),
                        ),
                        products.isNotEmpty
                            ? Expanded(
                                child: GridView.builder(
                                  padding: const EdgeInsets.all(10.0),
                                  itemCount: products.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Produce(
                                      title: products[index]['title'],
                                      image: products[index]['image'],
                                      price: products[index]['price'].toString(),
                                      quantity: products[index]['quantity'].toString(),
                                      docId: snapshot.data!.docs[index].id,
                                    );
                                  },
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: IconButton(
                                      padding: const EdgeInsets.only(top: 180),
                                      onPressed: () =>
                                          Get.to(() => const AddProduce()),
                                      icon: const Icon(
                                        Iconsax.add_circle,
                                        size: 70,
                                      ),
                                      color: MColors.accentColor,
                                    ),
                                  ),
                                  const SizedBox(height: 2.0),
                                  Center(
                                    child: Text('Add produce to get',
                                        style: TextStyle(
                                            fontFamily: 'DM Sans',
                                            fontSize: 16,
                                            color: dark
                                                ? MColors.textWhite
                                                    .withOpacity(0.7)
                                                : MColors.dark
                                                    .withOpacity(0.7))),
                                  ),
                                  Center(
                                    child: Text(
                                      'started',
                                      style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 16,
                                        color: dark
                                            ? MColors.textWhite.withOpacity(0.7)
                                            : MColors.dark.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}

class Produce extends StatelessWidget {
  const Produce({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.docId,
  });

  final String title;
  final String image;
  final String price;
  final String quantity;
  final String docId;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: MColors.white,
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(image),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: CachedNetworkImage(
                //   imageUrl: image,
                //   placeholder: (context, url) => CircularProgressIndicator(),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(title, style: const TextStyle(fontFamily: 'DM Sans', fontSize: 15, color: MColors.dark, fontWeight: FontWeight.w600)),
                    ),
                    const Spacer(),
                     IconButton(
                       onPressed: () => _deleteItem(context, docId),
                         icon: Icon(Iconsax.trash, color: MColors.error),
                       color: MColors.dark,
                     ),
                  ],
                ),
                 //SizedBox(height: 3),
                 Padding(
                   padding: const EdgeInsets.only(left: 5.0),
                   child: Text(
                     "N $price | $quantity",
                     style: TextStyle(
                       fontFamily: 'DM Sans',
                       fontSize: 13,
                       color: MColors.dark.withOpacity(0.6),
                     ),
                   ),
                 ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void _deleteItem(BuildContext context, String docId) async {
  try {
    // Delete the document from Firestore
    await FirebaseFirestore.instance.collection('Product').doc(docId).delete();

    // Optionally, show a snackbar message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item deleted successfully')),
    );
  } catch (e) {
    // Handle the error, e.g., by showing an error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error deleting item: $e')),
    );
  }
}
