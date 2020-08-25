
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListePrduits extends StatefulWidget {
  static String id="ListePrduits";

  @override
  _ListePrduitsState createState() => _ListePrduitsState();
}

class _ListePrduitsState extends State<ListePrduits> {
  bool sort;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produits "),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Catégorie :" + " CHEMISES",
                  style: TextStyle(
                  fontSize: 17,fontWeight: FontWeight.bold
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Total Produits restants :" + " 4",
                style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.bold
                ),),
            ),
            dataBody()
          ],
        ),
      ),
    );
  }

  DataTable dataBody() {
    return DataTable(
      sortAscending: true,
      sortColumnIndex: 0,
      columns: [
        DataColumn(
            label: Text("N° "),
            numeric: false,
            tooltip: "Produits",
          /*onSort: (columnIndex, ascending){
              setState(() {
                sort = !sort;
              });
              onSortColumn(columnIndex, ascending);
          }*/
        ),
        DataColumn(
            label: Text("Produits"),
            numeric: false,
            tooltip: "Nom du produit"
        ),
        DataColumn(
            label: Text("Taille"),
            numeric: false,
            tooltip: "Taille"
        ),DataColumn(
            label: Text("Prix"),
            numeric: false,
            tooltip: "Taille"
        ),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              Text("1",
                style: TextStyle(fontSize: 12),),
            ), DataCell(
              Text("Montre MEGIR",
              style: TextStyle(fontSize: 12),),
            ), DataCell(
              Text("Par défaut",
                style: TextStyle(fontSize: 12),),
            ), DataCell(
              Text("25.000 F CFA",
                style: TextStyle(fontSize: 12),),
            ),
          ]
        ),
        DataRow(
            cells: [
              DataCell(
                Text("2",
                  style: TextStyle(fontSize: 12),),
              ), DataCell(
                Text("Montre MEGIR",
                  style: TextStyle(fontSize: 12),),
              ), DataCell(
                Text("Par défaut",
                  style: TextStyle(fontSize: 12),),
              ), DataCell(
                Text("25.000 F CFA",
                  style: TextStyle(fontSize: 12),),
              ),
            ]
        ),
        DataRow(
            cells: [
              DataCell(
                Text("3",
                  style: TextStyle(fontSize: 12),),
              ), DataCell(
                Text("Montre MEGIR",
                  style: TextStyle(fontSize: 12),),
              ), DataCell(
                Text("Par défaut",
                  style: TextStyle(fontSize: 12),),
              ), DataCell(
                Text("25.000 F CFA",
                  style: TextStyle(fontSize: 12),),
              ),
            ]
        ),
        DataRow(
            cells: [
              DataCell(
                Text("4",
                  style: TextStyle(fontSize: 12),),
              ), DataCell(
                Text("Montre MEGIR",
                  style: TextStyle(fontSize: 12),),
              ), DataCell(
                Text("Par défaut",
                  style: TextStyle(fontSize: 12),),
              ), DataCell(
                Text("25.000 F CFA",
                  style: TextStyle(fontSize: 12),),
              ),
            ]
        )
      ],
    );
  }
}

