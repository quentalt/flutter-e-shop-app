import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast2/fluttertoast.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../db/category.dart';
import '../db/brand.dart';
import 'package:image_picker/image_picker.dart';
import '../db/product.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();
  ProductService productService = ProductService();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController ProductNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown = <
      DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _currentBrand;
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  List<String> selectedSizes = <String>[];
  File _fileImage1;
  File _fileImage2;
  File _fileImage3;
  bool isLoading = false;

  @override
  // ignore: must_call_super
  void initState() {
    _getBrands();
    _getCategories();
    //  _currentCategory = categoriesDropDown[0].value;
  }

  List<DropdownMenuItem<String>> getCategoriesDropDown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < categories.length; i++) {
      setState(() {
        //Map<String, dynamic> categories = jsonDecode(_currentCategory);
        items.insert(
            0, DropdownMenuItem(child: Text(categories[i].get('category')),
        value: categories[i].get('category')));
      });
    }
    return items;
  }

  List<DropdownMenuItem<String>> getBrandsDropDown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < categories.length; i++) {
      setState(() {
        Map<String, dynamic> categories = jsonDecode(_currentBrand);
        items.insert(0, DropdownMenuItem(child: Text(categories[i].data['brands']),
            value: categories[i].data['brands']));
      });
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: white,
        title: Text("ajout produit", style: TextStyle(color: black),),
      ),
      body: Form(
        key: _formKey,
          child: SingleChildScrollView(
          child: isLoading ? CircularProgressIndicator() : Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: grey.withOpacity(0.8), width: 2.5),
                          onPressed: () {
                            _selectImage(ImagePicker.pickImage(source: ImageSource
                                .gallery), 1);
                          },
                          child: _displayChild1()
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: grey.withOpacity(0.5), width: 2.5),
                          onPressed: () {
                            _selectImage(ImagePicker.pickImage(source: ImageSource
                                .gallery), 2);
                          },
                          child: _displayChild2()

                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: grey.withOpacity(0.8), width: 2.5),
                          onPressed: () {
                            _selectImage(ImagePicker.pickImage(source: ImageSource
                                .gallery), 3);
                          },
                          child: _displayChild3()
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("entre le nom d\'un produit avec 10 caractères max",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 12),),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: quantityController,
                  //initialValue: '1',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'nom du produit'
                  ),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Tu peux entrer le nom du produit';
                    } else if (value.length > 10) {
                      return 'le nom du produit ne peut dépasser 10 lettres';
                    }
                  },
                ),
              ),

              // selectionner les categories

              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Categorie: ', style: TextStyle(color: red),),
                  ),
                  DropdownButton(items: categoriesDropDown,
                    onChanged: changeSelectedCategory,
                    value: _currentCategory,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Marque: ', style: TextStyle(color: red),),
                  ),
                  DropdownButton(items: brandsDropDown,
                    onChanged: changeSelectedBrand,
                    value: _currentBrand,),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: ProductNameController,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      hintText: 'quantity'
                  ),
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Tu peux entrer le nom du produit';
                    }
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: priceController,
                  //initialValue: '0.00',
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      hintText: 'price'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Tu peux entrer le nom du produit';
                    }
                  },
                ),
              ),
              Text('Taille disponible'),

              Row(
                children: <Widget>[

                  Checkbox(value: selectedSizes.contains('28'),
                      onChanged: (value) => changeSelectedSize('XS')),
                  Text('XS'),

                  Checkbox(value: selectedSizes.contains('S'),
                      onChanged: (value) => changeSelectedSize('S')),
                  Text('S'),

                  Checkbox(value: selectedSizes.contains('M'),
                      onChanged: (value) => changeSelectedSize('M')),
                  Text('M'),

                  Checkbox(value: selectedSizes.contains('L'),
                      onChanged: (value) => changeSelectedSize('L')),
                  Text('L'),

                  Checkbox(value: selectedSizes.contains('XL'),
                      onChanged: (value) => changeSelectedSize('XL')),
                  Text('XL'),

                  Checkbox(value: selectedSizes.contains('XXL'),
                      onChanged: (value) => changeSelectedSize('XXL')),
                  Text('XXL'),
                ],
              ),

              Row(
                children: <Widget>[
                  Checkbox(value: selectedSizes.contains('28'),
                      onChanged: (value) => changeSelectedSize('28')),
                  Text('28'),

                  Checkbox(value: selectedSizes.contains('32'),
                      onChanged: (value) => changeSelectedSize('32')),
                  Text('32'),

                  Checkbox(value: selectedSizes.contains('34'),
                      onChanged: (value) => changeSelectedSize('34')),
                  Text('34'),

                  Checkbox(value: selectedSizes.contains('36'),
                      onChanged: (value) => changeSelectedSize('36')),
                  Text('36'),

                  Checkbox(value: selectedSizes.contains('38'),
                      onChanged: (value) => changeSelectedSize('38')),
                  Text('38'),
                ],
              ),

              Row(
                children: <Widget>[
                  Checkbox(value: selectedSizes.contains('40'),
                      onChanged: (value) => changeSelectedSize('40')),
                  Text('40'),

                  Checkbox(value: selectedSizes.contains('42'),
                      onChanged: (value) => changeSelectedSize('42')),
                  Text('42'),

                  Checkbox(value: selectedSizes.contains('44'),
                      onChanged: (value) => changeSelectedSize('44')),
                  Text('44'),

                  Checkbox(value: selectedSizes.contains('48'),
                      onChanged: (value) => changeSelectedSize('48')),
                  Text('48'),

                  Checkbox(value: selectedSizes.contains('50'),
                      onChanged: (value) => changeSelectedSize('50')),
                  Text('50'),
                ],
              ),

              FlatButton(
                color: red,
                textColor: white,
                child: Text('ajout du produit'),
                onPressed: () {
                  validateAndUpload();
                },
              )
            ],
          ),
      ),
        ),
    );
  }

  _getCategories() async {
    List<DocumentSnapshot> data = await _categoryService.getCategories();
    print(data.length);
    setState(() {
  categories = data;
      categoriesDropDown = getCategoriesDropDown();
      //Map<String, dynamic> categories = jsonDecode(_currentBrand);
      _currentCategory = categories[0].get('category');
    });
  }

  _getBrands() async {
    List<DocumentSnapshot> data = await _brandService.getBrands();
    print(data.length);
    setState(() {
      brands = data;
      brandsDropDown = getBrandsDropDown();
      //Map<String, dynamic> brands = jsonDecode(_currentBrand);
      _currentBrand = brands[0].get('brand');
    });
  }

  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() => _currentCategory = selectedBrand);
  }


  void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;
    switch (imageNumber) {
      case 1:
        setState(() => _fileImage1 = tempImg);
        break;
      case 2:
        setState(() => _fileImage2 = tempImg);
        break;
      case 3:
        setState(() => _fileImage3 = tempImg);
        break;
    }
  }

  Widget _displayChild1() {
    if (_fileImage1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(Icons.add, color: grey,),
      );
    } else {
      return Image.file(_fileImage1, fit: BoxFit.fill, width: double.infinity,);
    }
  }

  Widget _displayChild2() {
    if (_fileImage1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(Icons.add, color: grey,),
      );
    } else {
      return Image.file(_fileImage1, fit: BoxFit.fill, width: double.infinity,);
    }
  }

  Widget _displayChild3() {
    if (_fileImage1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(Icons.add, color: grey,),
      );
    } else {
      return Image.file(_fileImage1, fit: BoxFit.fill, width: double.infinity,);
    }
  }

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);

      if (_fileImage1 != null && _fileImage2 != null && _fileImage3 != null) {
        if (selectedSizes.isNotEmpty) {
          String imageUrl1;
          String imageUrl2;
          String imageUrl3;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 = "1${DateTime
              .now()
              .millisecondsSinceEpoch
              .toString()}.jpg";
          firebase_storage.UploadTask task1 = firebase_storage.FirebaseStorage
              .instance.ref().child(picture1).putFile(_fileImage1);
          final String picture2 = "2${DateTime
              .now()
              .millisecondsSinceEpoch
              .toString()}.jpg";
          firebase_storage.UploadTask task2 = firebase_storage.FirebaseStorage
              .instance.ref().child(picture2).putFile(_fileImage2);
          final String picture3 = "3${DateTime
              .now()
              .millisecondsSinceEpoch
              .toString()}.jpg";
          firebase_storage.UploadTask task3 = firebase_storage.FirebaseStorage
              .instance.ref().child(picture3).putFile(_fileImage3);

          firebase_storage.TaskSnapshot snapshot1 = await task1.then((
              snapshot) => snapshot);
          firebase_storage.TaskSnapshot snapshot2 = await task2.then((
              snapshot) => snapshot);

          task3.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();
            imageUrl2 = await snapshot2.ref.getDownloadURL();
            imageUrl3 = await snapshot3.ref.getDownloadURL();

            List<String> imageList = [imageUrl1, imageUrl2, imageUrl3];

            productService.uploadProduct(
                productName: ProductNameController.text,
                price: double.parse(priceController.text),
                sizes: selectedSizes,
                images: imageList,
            quantity: int.parse(quantityController.text));
            _formKey.currentState.reset();
            setState(()  => isLoading = false);
            Fluttertoast.showToast(msg: 'Produit ajouté');
            Navigator.pop(context);
          });

        } else {
          setState(() => isLoading = false);
          Fluttertoast.showToast(msg: 'Selectionne une taille');
        }
      } else {
        setState(() => isLoading = false);
        Fluttertoast.showToast(msg: 'Toutes les images peuvent ête vues');
      }
    }
  }
}

