import 'package:flutter/material.dart';
import 'package:iomco_project/Design/Lists/provinceList.dart';
//import 'package:iomco_project/Design/menu.dart';

class Identification extends StatefulWidget {
  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
   final List<String> _items = ['Agent OIM','Agent partenaire','Enqueteur','Administrateur de l\'application'].toList();

  String _selection;
  DateTime date;
  @override
  void initState() {
    //_selection = _items.first;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final dropdownMenuOptions = _items
        .map((String item) =>
            new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    return Scaffold(
      backgroundColor: Color(0xff416391),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Identifiez-vous!",style: TextStyle(color: Colors.black,)),backgroundColor: Colors.white,),
      body: ListView(
        children: <Widget>[
          Container(
            color: Color(0xff416391),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height/5,),
                  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new DropdownButtonFormField(
                            value: _selection,
                            items: dropdownMenuOptions,
                            onChanged: (s) {
                              setState(() {
                                _selection = s;
                              });
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                             border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                              hintText: 'Quel est votre statut?',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            //controller: cusername,
                            focusNode: FocusNode(),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                         borderRadius: new BorderRadius.circular(20.0)
                     ),
                                hintText: 'Votre nom'),
                                
                          ),
                      ),
                      SizedBox(
                          height: 16.0,
                        ),
                        
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                    child: Container(
                          
                          height: 55,
                          width: MediaQuery.of(context).size.width / 1.0,
                          decoration: BoxDecoration(
                              color: Color(0xffE06F4D),
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                //aller à charger villages
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MyProvList()));
                              },
                              child: Text(
                                'Continuer',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.normal,fontSize:MediaQuery.of(context).size.height/14 ),
                              ),
                            ),
                          ),
                          
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}