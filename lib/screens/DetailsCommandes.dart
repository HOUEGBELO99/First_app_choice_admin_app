import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:premierchoixadmin/components/calcul.dart';
import 'package:premierchoixadmin/components/hexadecimal.dart';


// ignore: must_be_immutable
class DetailsCommandes extends StatefulWidget {
  static String id="DetailsCommande";
  Map<String, dynamic> commande;
  int longueur;
  DetailsCommandes({this.commande, this.longueur});
  @override
  _DetailsCommandesState createState() => _DetailsCommandesState();
}

class _DetailsCommandesState extends State<DetailsCommandes> {
  Firestore _db = Firestore.instance;
  String idUtilisteur;
  String idCommandeAdmin;

  // Ici pour l'id de la commande la date de création de la commande a été utilisée
  String idCommandeUtilisateur;


  //Il peut avoir possibilité que deux utilisateurs commande au même moment les produits
  Future<void> recupIdCommande(String idUser) async {

    // Ici on récupère l'id de la commande chez l'utilisateur en vérifiant si l'id de la commande chez l'user
    // est égale à l'idCommandeUser dans les commandes chez l'Admin
   await _db
        .collection("Utilisateurs")
        .document(idUser)
        .collection("Commandes")
        .where("id", isEqualTo: widget.commande["idCommandeUser"])
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      setState(() {
        idCommandeUtilisateur = snapshot.documents.first.documentID;
        print(idCommandeAdmin);
      });
    });

   // Récupération de la commande chez l'Admin
   await _db
       .collection("Commandes")
       .where("created", isEqualTo: widget.commande["created"])
       .getDocuments()
       .then((QuerySnapshot snapshot) {
     setState(() {
       idCommandeAdmin = snapshot.documents.first.documentID;
       print(idCommandeAdmin);
     });
   });
  }

  Future<void> recupIdUtilisateur() async {
    _db
        .collection("Utilisateurs")
        .where("nomComplet", isEqualTo: widget.commande["nomComplet"])
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      if (snapshot.documents.isNotEmpty) {
        setState(() {
          idUtilisteur = snapshot.documents.first.documentID;
          print(idUtilisteur);
          recupIdCommande(snapshot.documents.first.documentID);
        });

      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   recupIdUtilisateur();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.commande["nomComplet"]),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: longueurPerCent(20, context)),
            Container(
              width: largeurPerCent(360.0, context),
              child: Material(
                borderRadius: BorderRadius.circular(7.0),
                color: Colors.white,
                elevation: 7.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: largeurPerCent(360.0, context),
                      child: Material(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7),),
                        color: HexColor("#FFC30D"),
                        child: Padding(
                          padding: EdgeInsets.all(longueurPerCent(10, context)),
                          child: Text(
                            "Info Client",
                            style: TextStyle(color: HexColor("#001C36"), fontFamily: 'MontserratBold', fontSize: 19.0, fontWeight: FontWeight.bold ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Nom Complet:",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            child: Padding(
                              padding:
                              EdgeInsets.only(right: largeurPerCent(10, context),left: largeurPerCent(20, context)),
                              child: Text(
                                widget.commande["nomComplet"],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Adresse de Livraison:",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                       Expanded(
                          flex: 8,
                          child: Container(
                            child: Padding(
                              padding:
                              EdgeInsets.only(right: largeurPerCent(10, context),left: largeurPerCent(20, context)),
                              child:  (widget.commande["lieuDeLivraison"]=="En Agence")? Text(
                                "Jonquet en face pharmacie. Immeuble blanc, 2ème étage.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ):Text(
                                widget.commande["quartier"] +
                                    ", " +
                                    widget.commande["indication"],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              bottom: longueurPerCent(10.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Contacts:",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(left: longueurPerCent(10, context),bottom:longueurPerCent(10,context) ),
                          child: Text(
                            widget.commande["telephone"],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: HexColor("#001C36"),
                              fontSize: 12,
                              fontFamily: "MontserratBold",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Date et heure de Livraison:",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            child: Padding(
                                padding:
                                EdgeInsets.only(right: largeurPerCent(10, context),left: largeurPerCent(20, context)),
                                child: Text(
                                  widget.commande["dateHeureDeLivraison"],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: HexColor("#001C36"),
                                    fontSize: 12,
                                    fontFamily: "MontserratBold",
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: longueurPerCent(20, context)),

                  ],
                ),
              ),
            ),
            SizedBox(height: longueurPerCent(20, context)),
            Container(
              width: largeurPerCent(360.0, context),
              child: Material(
                borderRadius: BorderRadius.circular(7.0),
                color: Colors.white,
                elevation: 7.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: largeurPerCent(360.0, context),
                      child: Material(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7),),
                        color: HexColor("#FFC30D"),
                        child: Padding(
                          padding: EdgeInsets.all(longueurPerCent(10, context)),
                          child: Text(
                            "Produits",
                            style: TextStyle(color: HexColor("#001C36"), fontFamily: 'MontserratBold', fontSize: 19.0, fontWeight: FontWeight.bold ),
                          ),
                        ),
                      ),
                    ),
                   ListView.builder(
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemCount: widget.longueur,
                       itemBuilder: (context, i){
                         return Column(
                           children: [
                             Row(
                               children: [
                                 Container(
                                   margin: EdgeInsets.only(
                                     top: longueurPerCent(10, context),
                                     bottom: longueurPerCent(10, context),
                                     left:longueurPerCent(10,context),
                                   ),
                                   height: longueurPerCent(
                                       60, context),
                                   width: largeurPerCent(80, context),
                                   child: Image.network(
                                     widget.commande["produitsCommander"][i]["image1"],
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                                 Expanded(
                                   child: Container(
                                       margin:EdgeInsets.only(top: longueurPerCent(8, context),
                                           left: longueurPerCent(10, context)),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                           SizedBox(height: longueurPerCent(0, context),),
                                           Text(
                                             widget.commande["produitsCommander"][i]["nomDuProduit"],
                                             textAlign: TextAlign.left,
                                             style: TextStyle(
                                                 color: HexColor(
                                                     "#909090"),
                                                 fontSize: 15,
                                                 fontFamily: "Regular"),
                                           ),
                                           SizedBox(
                                             height: longueurPerCent(
                                                 4.0, context),
                                           ),
                                           Text(
                                             "${widget.commande["produitsCommander"][i]["taille"]}",
                                             textAlign: TextAlign.left,
                                             style: TextStyle(
                                               color: HexColor("#001C36"),
                                               fontSize: 12,
                                               fontFamily: "MontserratBold",
                                               fontWeight: FontWeight.bold,
                                             ),
                                           ),
                                           SizedBox(
                                             height: longueurPerCent(
                                                 8.0, context),
                                           ),
                                           Text(
                                             "${widget.commande["produitsCommander"][i]["prix"]}",
                                             textAlign: TextAlign.right,
                                             style: TextStyle(
                                               color: HexColor("#00CC7b"),
                                               fontSize: 15,
                                               fontFamily: "MontserratBold",
                                               fontWeight: FontWeight.bold,
                                             ),
                                           ),
                                         ],
                                       )
                                   ),
                                 ),
                                 (widget.commande["produitsCommander"][i]["etatSurMesure"]==true)?
                                 Expanded(
                                   child: Container(
                                     child: Column(
                                       children: <Widget>[
                                         SizedBox(height: longueurPerCent(5, context),),
                                         Container(
                                           height: longueurPerCent(20, context),
                                           width: largeurPerCent(100, context),
                                           margin: EdgeInsets.only(left: longueurPerCent(20, context)),
                                           color: HexColor("#001C36"),
                                           child: Center(
                                             child: Text(
                                               "SUR MESURE",
                                               textAlign: TextAlign.right,
                                               style: TextStyle(
                                                   color: HexColor("#FFFFFF"),
                                                   fontSize: 9.0,
                                                   fontFamily: "MontserratBold",
                                                   fontWeight: FontWeight.bold

                                               ),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ):Text("")
                               ],
                             ),
                             Divider(
                               color: Colors.grey,
                               height: 1,
                             ),
                           ],
                         );
                       }),
                    Container(height: longueurPerCent(10, context),)
                  ],
                ),
              ),
            ),
            SizedBox(height: longueurPerCent(20, context),),
            Container(
              width: largeurPerCent(360.0, context),
              child: Material(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
                elevation: 7.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: largeurPerCent(360.0, context),
                      child: Material(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7),),
                        color: HexColor("#FFC30D"),
                        child: Padding(
                          padding: EdgeInsets.all(longueurPerCent(10, context)),
                          child: Text(
                            "Mensurations",
                            style: TextStyle(color: HexColor("#001C36"), fontFamily: 'MontserratBold', fontSize: 19.0, fontWeight: FontWeight.bold ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Prix total",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Container(
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: longueurPerCent(0, context)),
                              child: Text(
                                "32.500",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Padding(
                              padding:  EdgeInsets.only(right: longueurPerCent(0, context)),
                              child: Text(
                                " FCFA",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Prix total",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Container(
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: longueurPerCent(0, context)),
                              child: Text(
                                "32.500",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Padding(
                              padding:  EdgeInsets.only(right: longueurPerCent(0, context)),
                              child: Text(
                                " FCFA",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Prix total",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Container(
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: longueurPerCent(0, context)),
                              child: Text(
                                "32.500",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Padding(
                              padding:  EdgeInsets.only(right: longueurPerCent(0, context)),
                              child: Text(
                                " FCFA",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: longueurPerCent(10, context),),
                  ],
                ),
              ),
            ),
            Container(height: longueurPerCent(20, context),),
            Container(
              width: largeurPerCent(360.0, context),
              child: Material(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
                elevation: 7.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: largeurPerCent(360.0, context),
                      child: Material(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7),),
                        color: HexColor("#FFC30D"),
                        child: Padding(
                          padding: EdgeInsets.all(longueurPerCent(10, context)),
                          child: Text(
                            "Moyen de Paiement",
                            style: TextStyle(color: HexColor("#001C36"), fontFamily: 'MontserratBold', fontSize: 19.0, fontWeight: FontWeight.bold ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: (widget.commande["moyenDePayement"]=="Mobile Money")?Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mobile Money: ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: HexColor("#001C36"),
                                    fontSize: 15,
                                    fontFamily: "MonseraBold"),
                              ),
                              Text(
                                widget.commande["numeroDePayement"],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: HexColor("#909090"),
                                    fontSize: 12,
                                    fontFamily: "MonseraBold"),
                              ),
                            ],
                          ):Text(
                            "Espèce",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          )
                        ),
                      ],
                    ),
                    Container(height: longueurPerCent(10, context),),
                  ],
                ),
              ),
            ),
            Container(height: longueurPerCent(20, context),),
            Container(
              width: largeurPerCent(360.0, context),
              child: Material(
                borderRadius: BorderRadius.circular(7.0),
                color: Colors.white,
                elevation: 7.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: largeurPerCent(360.0, context),
                      child: Material(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7),),
                        color: HexColor("#FFC30D"),
                        child: Padding(
                          padding: EdgeInsets.all(longueurPerCent(10, context)),
                          child: Text(
                            "Total",
                        style: TextStyle(color: HexColor("#001C36"), fontFamily: 'MontserratBold', fontSize: 19.0, fontWeight: FontWeight.bold ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Sous total      ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: longueurPerCent(0, context)),
                              child: Text(
                                "${widget.commande["total"]} ",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Padding(
                              padding:  EdgeInsets.only(right: longueurPerCent(0, context)),
                              child: Text(
                                " FCFA",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Frais de Livraison   ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: longueurPerCent(0, context)),
                              child: Text(
                                "${widget.commande["prixLivraison"]} ",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(right: longueurPerCent(10, context)),
                            child: Padding(
                              padding:  EdgeInsets.only(right: longueurPerCent(0, context)),
                              child: Text(
                                " FCFA",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Sur mesure     ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: longueurPerCent(0, context)),
                              child: Text(
                                "500   ",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Padding(
                              padding:  EdgeInsets.only(right: longueurPerCent(0, context)),
                              child: Text(
                                " FCFA",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    SizedBox(height: longueurPerCent(10, context),),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: longueurPerCent(0.0, context),
                              right: longueurPerCent(0.0, context),
                              left: longueurPerCent(10.0, context)),
                          child: Text(
                            "Total",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: HexColor("#909090"),
                                fontSize: 12,
                                fontFamily: "MonseraBold"),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            child: Padding(
                              padding:
                              EdgeInsets.only(left: longueurPerCent(0, context)),
                              child: Text(
                                "${widget.commande["sousTotal"]} ",

                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Padding(
                              padding:  EdgeInsets.only(right: longueurPerCent(0, context)),
                              child: Text(
                                " FCFA",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: HexColor("#001C36"),
                                  fontSize: 12,
                                  fontFamily: "MontserratBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: longueurPerCent(10, context),),

                  ],
                ),
              ),
            ),
            SizedBox(height: longueurPerCent(200, context),),
          ],
        ),
      ),
      floatingActionButton: Center(
        child: Container(
          margin: EdgeInsets.only(
              top: MediaQuery
              .of(context)
              .size
              .height - 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Si la commande est validée alors le produit est supprimé(path produit categorie, sous-categorie et id_produit)
              // Commande validée ====> le statut en cours passe à livrer chez l'admin et le client
              // Le produit est supprimé des produits indisponibles si j'arrive à remettre le real data time au niveau des produits chez le client
              // Le nombre de commande validée est incrémenter
              // La somme des revenues augmente
              //
              RaisedButton(
                onPressed: () => commandeValider(),
                color: Colors.green,
                child: Text("Valider", style: TextStyle(color: Colors.white),),
              ),
              SizedBox(width: largeurPerCent(20, context),),
              // Commande annulée le produit est supprimé des produits indisponibles et est à nouveau disponible
              // Le statut en cours passe au rouge toujours mais avec le badge annulé chez l'admin et chez l'utilisateur
              //
              RaisedButton(
                onPressed: () {},
                child: Text("Annuler", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
    
  }

  Future<void> commandeValider() async{
   await  _db
        .collection("Utilisateurs")
        .document(idUtilisteur)
        .collection("Commandes")
        .document(idCommandeUtilisateur)
        .updateData({"livrer": true});
   await  _db
       .collection("Commandes")
       .document(idCommandeAdmin)
       .updateData({"livrer": true});
  }
}
