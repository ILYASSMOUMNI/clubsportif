import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "club Supform",
      home: MyHomePage(title: "Paiment Club"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              Text("Nombre de seance par semaine"),
              TextField(
                controller: txt,
                decoration: InputDecoration(
                  labelText: "Nombre de seance par semaine",
                ),
                keyboardType: TextInputType.number,
              ),
            Text(""),
            ListTile(
              title: Text('Enfant'),
              leading: Radio<String>(
                value: "enfant",
                groupValue: categ,
                onChanged: (val) {
                  setState(() {
                    categ = val!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Adulte'),
              leading: Radio(
                value: "Adulte",
                groupValue: categ,
                onChanged: (val) {
                  setState(() {
                    categ = val!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Premium"),
              leading: Checkbox(
                value: status,
                onChanged: (val) {
                  setState(() {
                    status = val!;
                  });
                },
              ),

            ),
            ElevatedButton(
              child: Text("Calcul"),
                onPressed : calculPrix,
            ),
            Text("Montant mensuel à payer : $prix"),
          ],
        ),
      ),
    );
  }
  String categ = "enfant";
  bool status = false;
  int prix = 0;
  TextEditingController txt=TextEditingController();
  void calculPrix() {
    setState(() {
      if (categ == "enfant") {
        prix = 15;
      } else if (categ == "Adulte") {
        prix = 30;
      }
      prix = prix * (int.parse(txt.text) * 4 );
      if (status){
        prix += 200;
      }
    });
  }
}
