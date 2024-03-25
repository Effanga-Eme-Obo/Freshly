import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshly/navbar.dart';
import 'package:freshly/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchProduce extends StatefulWidget {
  const SearchProduce({super.key});

  @override
  State<SearchProduce> createState() => _SearchProduceState();
}

class _SearchProduceState extends State<SearchProduce> {

  List _allResults = [];
  List _resultList = [];
  final TextEditingController _searchController = TextEditingController();


  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }
  _onSearchChanged(){
    searchResultList();

  }
  searchResultList(){
    var showResults = [];
    if(_searchController.text != ""){
      for(var clientSnapShot in _allResults){
        var name = clientSnapShot['title'].toString().toLowerCase();
        if(name.contains(_searchController.text.toLowerCase())){
          showResults.add(clientSnapShot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }

    setState(() {
      _resultList = showResults;
    });
  }

  getClientStream() async {
    var data = await FirebaseFirestore.instance.collection('Product').orderBy('title').get();

    setState(() {
      _allResults = data.docs;
    });
    searchResultList();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Iconsax.arrow_left),
              onPressed: () => Get.to(() => NavBar()),
            );
          },
        ),
        backgroundColor: MColors.white,
        title: CupertinoSearchTextField(
          controller: _searchController,
        ),
      ),
      body: ListView.builder(
        itemCount: _resultList.length,
          itemBuilder: (context,index){
          //final String imageUrl;
          return ListTile(
            title: Text(_resultList[index]['title'], style: const TextStyle(fontFamily: 'DM Sans', fontSize: 14, color: MColors.accentColor)),
            subtitle: Text(_resultList[index]['description'], style: const TextStyle(fontFamily: 'DM Sans', fontSize: 11, color: MColors.darkGrey)),
            trailing: Text(_resultList[index]['category'], style: const TextStyle(fontFamily: 'DM Sans', fontSize: 14, color: MColors.accentColor)),
          );
          }
      ),
    );
  }
}
