import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:eshopappproject/components/horizontal_listview.dart';
import 'package:eshopappproject/components/products.dart';

import 'cart.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: false,
        //animationCurve: Curves.fastOutSlowIn,
        //animationDuration: Duration(milliseconds: 1000),

        dotSize: 4.0,
        indicatorBgPadding: 4.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          title:Text('Appli Commerce'),
          actions: <Widget>[
            new IconButton(icon:Icon(
              Icons.search,color:Colors.white,),
                onPressed:(){}),
            new IconButton(icon:Icon(
              Icons.shopping_cart,color:Colors.white,),
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
                })
          ],
        ),
        drawer:new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text('Quentin Altieri'),
                accountEmail: Text('quentin.lolikat@gmail.com'),

                currentAccountPicture:GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor:Colors.grey,
                    child: Icon(Icons.person,color:Colors.white,),
                  ),
                ),
                decoration:new BoxDecoration(
                    color:Colors.pink
                ),
              ),

              InkWell(
                onTap:(){},
                child: ListTile(
                  title:Text('Page d\'accueil'),
                  leading: Icon(Icons.home,color: Colors.red,),
                ),
              ),

              InkWell(
                onTap:(){},
                child: ListTile(
                  title:Text('Mon compte'),
                  leading: Icon(Icons.person,color: Colors.red,),
                ),
              ),

              InkWell(
                onTap:(){},
                child: ListTile(
                  title:Text('Mes achats'),
                  leading: Icon(Icons.shopping_basket,color: Colors.red,),
                ),
              ),

              InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
                },
                child: ListTile(
                  title:Text('Categories'),
                  leading: Icon(Icons.shopping_cart, color: Colors.red,),
                ),
              ),

              InkWell(
                onTap:(){},
                child: ListTile(
                  title:Text('Favoris'),
                  leading: Icon(Icons.favorite,color: Colors.red,),
                ),
              ),

              Divider(),

              InkWell(
                onTap:(){},
                child: ListTile(
                  title:Text('Paramètres'),
                  leading: Icon(Icons.settings,color:Colors.blue),
                ),
              ),

              InkWell(
                onTap:(){},
                child: ListTile(
                  title:Text('About'),
                  leading: Icon(Icons.help,color:Colors.green),
                ),
              ),
            ],
          ),
        ),
        body: new Column(
          children: <Widget>[
            //image d'un carousel
            //imageCarousel,
            new Padding(padding: const EdgeInsets.all(4.0),
              child:Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Categories')),),
            //list view horizontale

            HorizontalList(),

            new Padding(padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Produits récents')),),

            //grid view
            Flexible(child: Products()),
          ],
        )
    );
  }
}