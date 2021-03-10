import 'package:flutter/material.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
          onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context)=> new HomePage()));},
        child:Text('Appli Commerce')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_old_price}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_new_price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // === le premier bouton ===
          Row(
            children: <Widget>[
              // taille du bouton
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Taille"),
                            content: new Text("Choisie la taille"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {

                                },
                                child: new Text("ferme"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Taille")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context){
                      return new AlertDialog(
                        title: new Text("Couleurs"),
                        content: new Text("Choisi la couleur"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: () {
                          Navigator.of(context).pop(context);
                          },
                          )
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Couleur")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantité"),
                            content: new Text("Choisi la quantité"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: new Text("ferme"),)
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Quantité")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
],
          ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                        onPressed: () {},
                        color: Colors.red,
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: new Text("Achetez maintenant")),
                  ),
                  new IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      color: Colors.red,
                      onPressed: () {}),
                  new IconButton(
                      icon: Icon(Icons.favorite_border),
                      color: Colors.red,
                      onPressed: () {})
                ],
              ),

          new ListTile(
            title: new Text("Détails du Produit"),
            subtitle: new Text("Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt."),
          ),
          Divider(),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                child: new Text("Nom du produit",style: TextStyle(color:Colors.grey),),),
            Padding(padding: EdgeInsets.all(5.0),
            child:new Text(widget.product_detail_name),)
            ],
          ),


          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
              child: new Text("Marque du produit",style: TextStyle(color:Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child:new Text("Marque X"),)
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                child: new Text("Condition du produit",style: TextStyle(color:Colors.grey),),),

        // Créer une marque
              Padding(padding: EdgeInsets.all(5.0),
                child:new Text("Nouvelle"),)
            ],
          ),
        Divider(),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Produits Similaire"),
        ),

        // Section de produit similaire
          Container(
            height: 360.0,
            child:Similar_products(),
          )
        ],
      ),
    );
  }
}
class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpeg",
      "old_price":120,
      "price":35,
    },

    {
      "name":"blazer pour femme",
      "picture":"images/products/blazer2.jpeg",
      "old_price":120,
      "price":35,
    },
    {
      "name":"Robe rouge ",
      "picture":"images/products/dress1.jpeg",
      "old_price":90,
      "price":25,
    },

    {
      "name":"robe noire dentelée",
      "picture":"images/products/dress2.jpeg",
      "old_price":90,
      "price":25,
    },

    {
      "name":"talon noir",
      "picture":"images/products/hills1.jpeg",
      "old_price":20,
      "price":29,
    },

    {
      "name":"jupe fleurie",
      "picture":"images/products/skt1.jpeg",
      "old_price":90,
      "price":25,
    },

    {
      "name":"jupe rose",
      "picture":"images/products/skt2.jpeg",
      "old_price":90,
      "price":25,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2), itemBuilder: (BuildContext context, int index){
      return Similar_single_prod(
        prod_name: product_list[index]['name'],
        prod_picture: product_list[index]['picture'],
        prod_old_price: product_list[index]['old_price'],
        prod_price: product_list[index]['price'],
      );
    });
  }
}

class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

@override
Widget build(BuildContext context) {
  return Card(
    child: Hero(
        tag: new Text("hero 1"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(

              //Nous passons les valeurs des détails du produit

                builder: (context) => new ProductDetails(
                  product_detail_name: prod_name,
                  product_detail_new_price: prod_price,
                  product_detail_old_price: prod_old_price,
                  product_detail_picture: prod_picture,
                ))),

            child: GridTile(
                footer: Container(
                    color:Colors.white,
                    child: new Row(children: <Widget>[
                      Expanded(
                        child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ),
                      new Text("\$${prod_price}", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                    ],)
                ),
                child: Image.asset(
                  prod_picture,
                  fit: BoxFit.cover,
                )),
          ),
        )),
  );
}
}


