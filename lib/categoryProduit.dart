import 'package:flutter/material.dart';
import 'package:premierchoixadmin/ListeProduits.dart';
import 'package:premierchoixadmin/components/calcul.dart';

import 'components/hexadecimal.dart';

class categorieProduits extends StatefulWidget {
static String id="categorieProduits";

@override
_categorieProduitsState createState() => _categorieProduitsState();
}

class _categorieProduitsState extends State<categorieProduits> {
  bool sort;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Catégories "),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Hommes",
                style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
                children: [
                  SizedBox(height: longueurPerCent(30, context),),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(20, context),left: longueurPerCent(10, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.grey,
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "Accessoires",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 23,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(20, context),left: longueurPerCent(30, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.blue,
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "Chaussures",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 23,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
            Row(
                children: [
                  SizedBox(height: longueurPerCent(30, context),),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(20, context),left: longueurPerCent(10, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color:Colors.red,
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "Jeans",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 23,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(20, context),left: longueurPerCent(30, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color: HexColor("#55D062"),
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "T-Shirt",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 23,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
            Row(
                children: [
                  SizedBox(height: longueurPerCent(30, context),),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(30, context),left: longueurPerCent(10, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.yellow,
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "Chemises",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 23,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(30, context),left: longueurPerCent(30, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.purple,
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "Pulls & Jaquets",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 22,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Femmes",
                style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pink
                ),
              ),
            ),
            Row(
                children: [
                  SizedBox(height: longueurPerCent(30, context),),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(20, context),left: longueurPerCent(10, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.grey,
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "Accessoires",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 23,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(20, context),left: longueurPerCent(30, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.blue,
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "Chaussures",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 23,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
            Row(
                children: [
                  SizedBox(height: longueurPerCent(30, context),),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(20, context),left: longueurPerCent(10, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color:Colors.red,
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "Jeans",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 23,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(20, context),left: longueurPerCent(30, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color: HexColor("#55D062"),
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "T-Shirt",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 23,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
            Row(
                children: [
                  SizedBox(height: longueurPerCent(30, context),),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(30, context),left: longueurPerCent(10, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.yellow,
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "Chemises",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 23,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: longueurPerCent(30, context),left: longueurPerCent(30, context)),
                    height: longueurPerCent(50.0, context),
                    width: largeurPerCent(180.0, context),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,ListePrduits.id);
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.purple,
                        elevation: 7.0,
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.only(left:longueurPerCent(0, context)),
                            child: Text(
                              "Pulls & Jaquets",
                              style: TextStyle(
                                color: HexColor("#FFFFFF"),
                                fontSize: 22,
                                fontFamily: "MonseraBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}