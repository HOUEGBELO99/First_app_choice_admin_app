import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:premierchoixadmin/Models/produit.dart';
import 'package:premierchoixadmin/components/calcul.dart';
import 'package:premierchoixadmin/components/firestore_service.dart';
import 'package:path/path.dart' as Path;


/*import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../db/category.dart';
import '../db/brand.dart';
import 'package:fluttertoast/fluttertoast.dart';*/

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  /*CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();*/
  Firestore _db = Firestore.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image1;
  File _image2;
  File _image3;
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController starController = TextEditingController();
  bool surMesure;
  String productName;
  String price;
  String size;
  String description;
  String numberStar;
  /*List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];*/
  List<DropdownMenuItem<String>> categoriesDropDown = <
      DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _currentBrand;
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;

  String _dropDownValue2;
  String _dropDownValue3;
  String categorie;
  String sousCategorie;
  List<String> listSousCategories=["ACCESSOIRES", "CHAUSSURES", "CHEMISES", "JEANS", "PULLS & JACKET", "T-SCHIRT"];

  @override
  void initState() {
    /*_getCategories();
    _getBrands();*/
    setState(() {
      surMesure = false;
    });
  }

  /*List<DropdownMenuItem<String>> getCategoriesDropdown(){
    List<DropdownMenuItem<String>> items = new List();
    for(int i = 0; i < categories.length; i++){
      setState(() {
        items.insert(0, DropdownMenuItem(child: Text(categories[i].data['category']),
            value: categories[i].data['category']));
      });
    }
    return items;
  }

  List<DropdownMenuItem<String>> getBrandosDropDown(){
    List<DropdownMenuItem<String>> items = new List();
    for(int i = 0; i < brands.length; i++){
      setState(() {
        items.insert(0, DropdownMenuItem(child: Text(brands[i].data['brand']),
            value: brands[i].data['brand']));
      });
    }
    return items;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: white,
        leading: Icon(Icons.close, color: black,),
        title: Text("add product", style: TextStyle(color: black),),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(color: grey.withOpacity(0.5),
                              width: 2.5),
                          onPressed: () {
                            _selectImage(ImagePicker.pickImage(
                                source: ImageSource.camera), 1);
                          },
                          child: _displayChild1()
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(color: grey.withOpacity(0.5),
                              width: 2.5),
                          onPressed: () {
                            _selectImage(ImagePicker.pickImage(
                                source: ImageSource.camera), 2);
                          },
                          child: _displayChild2()
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                        borderSide: BorderSide(color: grey.withOpacity(0.5),
                            width: 2.5),
                        onPressed: () {
                          _selectImage(ImagePicker.pickImage(
                              source: ImageSource.camera), 3);
                        },
                        child: _displayChild3(),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: longueurPerCent(20, context),),
              Center(
                child: Container(
                  width: largeurPerCent(347.0, context),
                  height: longueurPerCent(40, context),
                  padding: EdgeInsets.only(
                      left: largeurPerCent(10, context),
                      right: largeurPerCent(20, context),
                      top: longueurPerCent(0, context)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                      border: Border.all(
                          color: Colors.grey, width: 1)),
                  child: DropdownButton(
                    underline: Text(""),
                    hint: _dropDownValue2 == null
                        ? Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    )
                        : Text(
                      _dropDownValue2,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    isExpanded: true,
                    iconSize: 30.0,
                    items:
                    ['Hommes' ,'Femmes'].map(
                          (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                            () {
                          _dropDownValue2 = val;
                          categorie=val;

                        },
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: longueurPerCent(20, context),),
              Center(
                child: Container(
                  width: largeurPerCent(347.0, context),
                  height: longueurPerCent(40, context),
                  padding: EdgeInsets.only(
                      left: largeurPerCent(10, context),
                      right: largeurPerCent(20, context),
                      top: longueurPerCent(0, context)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                      border: Border.all(
                          color: Colors.grey, width: 1)),
                  child: DropdownButton(
                    underline: Text(""),
                    hint: _dropDownValue3 == null
                        ? Text(
                      'Sous-catégories',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    )
                        : Text(
                      _dropDownValue3,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    isExpanded: true,
                    iconSize: 30.0,
                    items:
                    listSousCategories.map(
                          (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                            () {
                          _dropDownValue3 = val;
                          sousCategorie=val;
                        },
                      );
                    },
                  ),
                ),
              ),

             /* Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: largeurPerCent(20, context),),
                    child: Text('Category: ', style: TextStyle(color: red),),
                  ),
                  DropdownButton(items: categoriesDropDown,
                    onChanged: changeSelectedCategory,
                    value: _currentCategory,),

                  Padding(
                    padding: EdgeInsets.only(
                      left: largeurPerCent(20, context),),
                    child: Text('Brand: ', style: TextStyle(color: red),),
                  ),
                  DropdownButton(items: brandsDropDown,
                    onChanged: changeSelectedBrand,
                    value: _currentBrand,),
                ],
              ),*/

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: productNameController,
                  decoration: InputDecoration(
                      hintText: 'Product name'
                  ),
                  onChanged: (value){
                    setState(() {
                      productName=value;
                    });
                  },
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You must enter the product name';
                    }
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                      hintText: 'Price'
                  ),
                  onChanged: (value){
                    setState(() {
                      price=value;
                    });
                  },
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You must enter the price of product ';
                    }
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: sizeController,
                  decoration: InputDecoration(
                      hintText: 'Size'
                  ),
                  onChanged: (value){
                    setState(() {
                      size=value;
                    });
                  },
                  // ignore: missing_return
                  validator: (value) {
                    // ignore: missing_return
                    if (value.isEmpty) {
                      return 'You must enter the size of product ';
                    // ignore: missing_return
                    }
                  },
                ),
              ),


              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: _buildTextFieldDescription()
              ),


              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: starController,
                  decoration: InputDecoration(
                      hintText: 'Star number'
                  ),
                  onChanged: (value){
                    setState(() {
                      numberStar=value;
                    });
                  },
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You must enter the number star of product ';
                    }
                  },

                ),
              ),
//              select category

              Row(
                children: <Widget>[
                  Checkbox(
                    value: surMesure,
                    onChanged: (bool value) {
                      setState(() {
                        surMesure = value;
                      });
                    },
                  ),
                  Text('Sur Mesure'),
                ],
              ),

              FlatButton(
                color: red,
                textColor: white,
                child: Text('add product'),
                onPressed: () {
                  productCreatedAndUpload();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldDescription() {
    final maxLines = 5;

    return Container(
      height: maxLines * 24.0,
      child: TextFormField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: "Description",
        ),
        onChanged: (value){
          setState(() {
            description=value;
          });
        },
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) {
            return 'You must enter the description of product ';
          }
        },


      ),
    );
  }

  /* _getCategories() async{
    List<DocumentSnapshot> data = await _categoryService.getCategories();
    print(data.length);
    setState(() {
      categories = data;
      categoriesDropDown = getCategoriesDropdown();
      _currentCategory = categories[0].data['category'];
    });
  }

  _getBrands() async{
    List<DocumentSnapshot> data = await _brandService.getBrands();
    print(data.length);
    setState(() {
      brands = data;
      brandsDropDown = getBrandosDropDown();
      _currentBrand = brands[0].data['brand'];
    });
  }*/

  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() => _currentCategory = selectedBrand);
  }

  /*void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }*/

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;
    switch (imageNumber) {
      case 1:
        setState(() => _image1 = tempImg);
        break;
      case 2:
        setState(() => _image2 = tempImg);
        break;
      case 3:
        setState(() => _image3 = tempImg);
        break;
    }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(Icons.add, color: grey,),
      );
    } else {
      return Image.file(_image1, fit: BoxFit.fill, width: double.infinity,);
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(Icons.add, color: grey,),
      );
    } else {
      return Image.file(_image2, fit: BoxFit.fill, width: double.infinity,);
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(Icons.add, color: grey,),
      );
    } else {
      return Image.file(_image3, fit: BoxFit.fill, width: double.infinity,);
    }
  }

 /* void validateAndUpload() {
    if (_formKey.currentState.validate()) {
      if (_image1 != null && _image2 != null && _image3 != null) {
        if (selectedSizes.isNotEmpty) {
          String imageUrl;
          final String picture = "${DateTime
              .now()
              .millisecondsSinceEpoch
              .toString()}.jpg";
          //StorageUploadTask task = storage.ref;
        } else {
          Fluttertoast.showToast(msg: 'select atleast one size');
        }
      } else {
        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }*/

  Future<void> productCreatedAndUpload() async {
    if (_formKey.currentState.validate()) {
      if (_image1 != null && _image2 != null && _image3 != null) {
        String imageUrl1;
        String imageUrl2;
        String imageUrl3;
        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture = "${DateTime
            .now()
            .millisecondsSinceEpoch
            .toString()}.jpg";
        StorageUploadTask task1 = storage.ref().child(categorie + '/'+ sousCategorie +  '/${Path.basename(_image1.path)}}').putFile(_image1);
        StorageUploadTask task2 = storage.ref().child(categorie + '/'+ sousCategorie +  '/${Path.basename(_image2.path)}}').putFile(_image2);
        StorageUploadTask task3 = storage.ref().child(categorie + '/'+ sousCategorie +  '/${Path.basename(_image3.path)}}').putFile(_image3);



        StorageTaskSnapshot snapshot1 = await task1.onComplete.then((
            snapshot) => snapshot);
        StorageTaskSnapshot snapshot2 = await task2.onComplete.then((
            snapshot) => snapshot);
        task3.onComplete.then((snapshot3)  async{
            imageUrl1 = await snapshot1.ref.getDownloadURL();
            imageUrl2 = await snapshot2.ref.getDownloadURL();
            imageUrl3 = await snapshot3.ref.getDownloadURL();
            print(imageUrl1);
            print(imageUrl2);
            print(imageUrl3);
            if(imageUrl1!=null && imageUrl2!=null && imageUrl3!=null) {
              print("ça marche");
              _db.collection(categorie).document(sousCategorie).collection("Produits").add({
              "nomDuProduit": productName,
              "prix": int.parse(price),
              "description": description,
                "image1": imageUrl1,
              "image2": imageUrl2,
              "image3": imageUrl3,
              "selectImage": imageUrl1,
              "numberImages": 3,
              "surMesure": surMesure,
              "taille": size,
              "numberStar": int.parse(numberStar),
              }).then((value) {
                this._db.collection(categorie).document(sousCategorie).collection("Produits").document(value.documentID).updateData({
                  "id": value.documentID
                });
              });
            }
            /*var addDoc = this.db.collection('items').add(data).then(ref => {
      var updateNested = this.db.collection('items').doc(ref.id).update({
        id: ref.id
      });
    });*/
        });
      } else if (_image1!=null && _image2!=null){
        String imageUrl1;
        String imageUrl2;
        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture = "${DateTime
            .now()
            .millisecondsSinceEpoch
            .toString()}.jpg";
        StorageUploadTask task1 = storage.ref().child(categorie + '/'+ sousCategorie +  '/${Path.basename(_image1.path)}}').putFile(_image1);
        StorageUploadTask task2 = storage.ref().child(categorie + '/'+ sousCategorie +  '/${Path.basename(_image2.path)}}').putFile(_image2);



        StorageTaskSnapshot snapshot1 = await task1.onComplete.then((
            snapshot) => snapshot);
        task2.onComplete.then((snapshot2)  async{
          imageUrl1 = await snapshot1.ref.getDownloadURL();
          imageUrl2 = await snapshot2.ref.getDownloadURL();
          print(imageUrl1);
          print(imageUrl2);
          if(imageUrl1!=null && imageUrl2!=null) {
            print("ça marche");
            _db.collection(categorie).document(sousCategorie).collection("Produits").add({
              "nomDuProduit": productName,
              "prix": int.parse(price),
              "description": description,
              "image1": imageUrl1,
              "image2": imageUrl2,
              "selectImage": imageUrl1,
              "numberImages": 2,
              "surMesure": surMesure,
              "taille": size,
              "numberStar": int.parse(numberStar),
            }).then((value) {
              this._db.collection(categorie).document(sousCategorie).collection("Produits").document(value.documentID).updateData({
                "id": value.documentID
              });
            });
          }
        });
      } else if(_image1!=null){
        String imageUrl1;
        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture = "${DateTime
            .now()
            .millisecondsSinceEpoch
            .toString()}.jpg";
        StorageUploadTask task1 = storage.ref().child(categorie + '/'+ sousCategorie +  '/${Path.basename(_image1.path)}}').putFile(_image1);

        task1.onComplete.then((snapshot1)  async{
          imageUrl1 = await snapshot1.ref.getDownloadURL();
          print(imageUrl1);
          if(imageUrl1!=null ) {
            print("ça marche");
            _db.collection(categorie).document(sousCategorie).collection("Produits").add({
              "nomDuProduit": productName,
              "prix": int.parse(price),
              "description": description,
              "image1": imageUrl1,
              "selectImage": imageUrl1,
              "numberImages": 1,
              "surMesure": surMesure,
              "taille": size,
              "numberStar": int.parse(numberStar),
            }).then((value) {
              this._db.collection(categorie).document(sousCategorie).collection("Produits").document(value.documentID).updateData({
                "id": value.documentID
              });
            });
           /* FirestoreService().addProducts(Produit(
              nomDuProduit: productName,
              prix: int.parse(price),
              description: description,
              image1: imageUrl1,
              selectImage: imageUrl1,
              numberImages: 1,
              surMesure: surMesure,
              taille: size,
              numberStar: int.parse(numberStar),
            ), categorie, sousCategorie);*/
          }
        });
      }
    }
  }
}


/*Text('Available Sizes'),

              Row(
                children: <Widget>[
                  Checkbox(value: selectedSizes.contains('XS'), onChanged: (value) => changeSelectedSize('XS')),
                  Text('XS'),

                  Checkbox(value: selectedSizes.contains('S'), onChanged: (value) => changeSelectedSize('S')),
                  Text('S'),

                  Checkbox(value: selectedSizes.contains('M'), onChanged: (value) => changeSelectedSize('M')),
                  Text('M'),

                  Checkbox(value: selectedSizes.contains('L'), onChanged: (value) => changeSelectedSize('L')),
                  Text('L'),

                  Checkbox(value: selectedSizes.contains('XL'), onChanged: (value) => changeSelectedSize('XL')),
                  Text('XL'),

                  Checkbox(value: selectedSizes.contains('XXL'), onChanged: (value) => changeSelectedSize('XXL')),
                  Text('XXL'),
                ],
              ),

              Row(
                children: <Widget>[
                  Checkbox(value: selectedSizes.contains('28'), onChanged: (value) => changeSelectedSize('28')),
                  Text('28'),

                  Checkbox(value: selectedSizes.contains('30'), onChanged: (value) => changeSelectedSize('30')),
                  Text('30'),

                  Checkbox(value: selectedSizes.contains('32'), onChanged: (value) => changeSelectedSize('32')),
                  Text('32'),

                  Checkbox(value: selectedSizes.contains('34'), onChanged: (value) => changeSelectedSize('34')),
                  Text('34'),


                  Checkbox(value: selectedSizes.contains('36'), onChanged: (value) => changeSelectedSize('36')),
                  Text('36'),

                  Checkbox(value: selectedSizes.contains('38'), onChanged: (value) => changeSelectedSize('38')),
                  Text('38'),
                ],
              ),

              Row(
                children: <Widget>[
                  Checkbox(value: selectedSizes.contains('40'), onChanged: (value) => changeSelectedSize('40')),
                  Text('40'),

                  Checkbox(value: selectedSizes.contains('42'), onChanged: (value) => changeSelectedSize('42')),
                  Text('42'),

                  Checkbox(value: selectedSizes.contains('44'), onChanged: (value) => changeSelectedSize('44')),
                  Text('44'),

                  Checkbox(value: selectedSizes.contains('46'), onChanged: (value) => changeSelectedSize('46')),
                  Text('46'),

                  Checkbox(value: selectedSizes.contains('48'), onChanged: (value) => changeSelectedSize('48')),
                  Text('48'),

                  Checkbox(value: selectedSizes.contains('50'), onChanged: (value) => changeSelectedSize('50')),
                  Text('50'),
                ],
              ),
*/