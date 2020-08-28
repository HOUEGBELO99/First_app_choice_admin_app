import 'package:flutter/material.dart';
import 'package:premierchoixadmin/categoryProduit.dart';
import 'package:premierchoixadmin/components/calcul.dart';
import 'package:premierchoixadmin/screens/order.dart';

import 'add_products.dart';
/*import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_admin/screens/add_product.dart';
import '../db/category.dart';
import '../db/brand.dart';*/

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  static String id="Admin";
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.dashboard);
                      },
                      icon: Icon(
                        Icons.dashboard,
                        color: _selectedPage == Page.dashboard
                            ? active
                            : notActive,
                      ),
                      label: Text('Dashboard'))),
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.manage);
                      },
                      icon: Icon(
                        Icons.sort,
                        color:
                        _selectedPage == Page.manage ? active : notActive,
                      ),
                      label: Text('Manage'))),
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: _loadScreen());
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(
              subtitle: FlatButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.green,
                ),
                label: Text('12,000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: Colors.green)),
              ),
              title: Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                              title: FlatButton.icon(
                                  onPressed: null,
                                  icon: Icon(Icons.people_outline),
                                  label: Text("Utlisateurs")),
                              subtitle: Text(
                                '24',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: active, fontSize: 40.0),
                              ),
                          ),
                          Row(
                            children: [
                              Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: longueurPerCent(5, context),top: longueurPerCent(10, context)),
                                      child: Text("Hommes",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.blue, fontSize: 15.0),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: longueurPerCent(10, context)),
                                      child: Text("12",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: active, fontSize: 15.0),),
                                    )

                                  ]),
                              Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: longueurPerCent(30, context),top: longueurPerCent(10, context)),
                                      child: Text("Femmes",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.pink, fontSize: 15.0),),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: longueurPerCent(10, context),left: longueurPerCent(20, context)),
                                        child: Text("12",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: active, fontSize: 15.0),),
                                      ),
                                    )

                                  ]),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: Column(
                        children: [
                              ListTile(
                              title: FlatButton.icon(
                                  onPressed: null,
                                  icon: Icon(Icons.category),
                                  label: Text("Catégories")),
                              subtitle: Text(
                                '9',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: active, fontSize: 40.0),
                              )),
                          Row(
                            children: [
                              Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: longueurPerCent(5, context),top: longueurPerCent(10, context)),
                                      child: Text("Hommes",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.blue, fontSize: 15.0),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: longueurPerCent(10, context)),
                                      child: Text("6",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: active, fontSize: 15.0),),
                                    )

                                  ]),
                              Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: longueurPerCent(30, context),top: longueurPerCent(10, context)),
                                      child: Text("Femmes",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.pink, fontSize: 15.0),),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: longueurPerCent(10, context),left: longueurPerCent(20, context)),
                                        child: Text("6",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: active, fontSize: 15.0),),
                                      ),
                                    )

                                  ]),
                            ],
                          )
                            ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: Column(
                        children: [
                              ListTile(
                              title: FlatButton.icon(
                                  onPressed: null,
                                  icon: Icon(Icons.track_changes),
                                  label: Text("Restants"),),
                              subtitle: Text(
                                '120/200',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: active, fontSize: 35.0),
                              )),
                          Row(
                            children: [
                              Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: longueurPerCent(5, context),top: longueurPerCent(10, context)),
                                      child: Text("Hommes",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.blue, fontSize: 15.0),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: longueurPerCent(10, context)),
                                      child: Text("60/100",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: active, fontSize: 15.0),),
                                    )

                                  ]),
                              Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: longueurPerCent(30, context),top: longueurPerCent(10, context)),
                                      child: Text("Femmes",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.pink, fontSize: 15.0),),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: longueurPerCent(10, context),left: longueurPerCent(20, context)),
                                        child: Text("60/100",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: active, fontSize: 15.0),),
                                      ),
                                    )

                                  ]),
                            ],
                          )
                            ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.shopping_cart),
                              label: Text("Commandes")),
                          subtitle: Text(
                            '5/10',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        break;
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Ajouter un produits"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => AddProduct()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Liste des produits"),
              onTap: () {
                Navigator.pushNamed(context, categorieProduits.id);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text("Ajouter une catégorie"),
              onTap: () {
               // _categoryAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Liste des catégories"),
              onTap: () {
                Navigator.pushNamed(context, categorieProduits.id);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Liste des commandes"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => OrderList()));
              },
            ),
            Divider(),
          ],
        );
        break;
      default:
        return Container();
    }
  }

  /*void _categoryAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryFormKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value){
            if(value.isEmpty){
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(
              hintText: "add category"
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          if(categoryController.text != null){
            _categoryService.createCategory(categoryController.text);
          }
          Fluttertoast.showToast(msg: 'category created');
          Navigator.pop(context);
        }, child: Text('ADD')),
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('CANCEL')),

      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }

  void _brandAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _brandFormKey,
        child: TextFormField(
          controller: brandController,
          validator: (value){
            if(value.isEmpty){
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(
              hintText: "add brand"
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          if(brandController.text != null){
            _brandService.createBrand(brandController.text);
          }
          Fluttertoast.showToast(msg: 'brand added');
          Navigator.pop(context);
        }, child: Text('ADD')),
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('CANCEL')),

      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }*/
}