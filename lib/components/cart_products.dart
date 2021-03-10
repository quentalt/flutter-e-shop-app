import 'package:flutter/material.dart';

class Cart_product extends StatefulWidget {
  @override
  _Cart_productState createState() => _Cart_productState();
}

class _Cart_productState extends State<Cart_product> {

  var Products_on_the_cart = [
    {
      "name":"Blazer noir pour homme",
      "picture":"images/products/blazer1.jpeg",
      "price":35,
      "size":"M",
      "color":"Black",
      "Quantity":1,
    },
    {
      "name":"Talons noir",
      "picture":"images/products/hills1.jpeg",
      "price":50,
      "size":"7",
      "color":"Black",
      "Quantity":1,
    },
    {
      "name":"Talons noir",
      "picture":"images/products/hills1.jpeg",
      "price":50,
      "size":"7",
      "color":"Black",
      "Quantity":1,
    },
  ];

  @override
  Widget build(BuildContext context){
      return new ListView.builder(
          itemCount: Products_on_the_cart.length,
          itemBuilder: (context,index){
         return Single_cart_product(
           cart_prod_name: Products_on_the_cart[index]["name"],
           cart_prod_color: Products_on_the_cart[index]["color"],
           cart_prod_qty: Products_on_the_cart[index]["quantity"],
           cart_prod_size: Products_on_the_cart[index]["size"],
           cart_prod_old_price: Products_on_the_cart[index]["old price"],
           cart_prod_price: Products_on_the_cart[index]["price"],
           cart_prod_picture: Products_on_the_cart[index]["picture"],
         );
      });
    }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_old_price;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_color,
    this.cart_prod_old_price,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_qty,
    this.cart_prod_size,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // === SECTION DU LEADING
        leading: new Image.asset(cart_prod_picture,width: 80.0, height: 80.0,),
        title: new Text(cart_prod_name),
        subtitle: new Column(
          children: <Widget>[
// Lignes dans la colonne

          new Row(
            children: <Widget>[
              
              Padding(
                  padding: const EdgeInsets.all(4.0),
                child: new Text("Taille"),
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: new Text(cart_prod_size, style: TextStyle(color:Colors.red),),
              ),

            // ==== Cette section est la couleur du produit ====

            new Padding(padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0,),
                child: new Text("Couleur"),),
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: new Text(cart_prod_color, style: TextStyle(color:Colors.red),),
          ),
            ],
          ),

            new Container(
              alignment: Alignment.topLeft,
            child: new Text("\$${cart_prod_price}",
            style:TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color:Colors.red
    ),
            ),
            )
          ],
        ),

          trailing: new Column(
            children: <Widget>[

              new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
              new Text("$cart_prod_qty"),
              new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})

            ],
          )
      ),
    );
  }

}

