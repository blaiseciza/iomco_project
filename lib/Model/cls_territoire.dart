import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iomco_project/Database/DBHelper.dart';

class Territoire {
  int colIdt;
  String colAdm2pcode;
  String colAdm1pcodet;
  String colTname;

  Territoire();

  //CRUD FUNCTIONS
  Future<List<Territoire>> getTerritoire(String adm1Pcode) async {
    List<Territoire> territoires;
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    List<Map> list =
        await db_connection.rawQuery('SELECT * FROM ${DBHelper.territoireTable} WHERE ${DBHelper.colAdm1pcodet}=\'$adm1Pcode\'');
    territoires = new List();
    for (int i = 0; i < list.length; i++) {
      Territoire t = new Territoire();
      t.colIdt = list[i]['${DBHelper.colIdt}'];
      t.colAdm1pcodet = list[i]['${DBHelper.colAdm1pcodet}'];
      t.colTname = list[i]['${DBHelper.colTname}'];
      t.colAdm2pcode = list[i]['${DBHelper.colAdm2pcode}'];

      territoires.add(t);
    }
    
    }catch(e){

    }
    return territoires;
  }

  void addNewTerritoire(Territoire t) async {
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query =
        'INSERT INTO ${DBHelper.territoireTable}(${DBHelper.colAdm1pcodet},${DBHelper.colTname},${DBHelper.colAdm2pcode}) VALUES(\'${t.colAdm1pcodet}\',\'${t.colTname}\',\'${t.colAdm2pcode}\')';
    await db_connection.transaction((transaction) async {
      return await transaction.rawInsert(query);
    });
    Fluttertoast.showToast(msg:'Territoire Enregistré',toastLength:Toast.LENGTH_SHORT,
                              backgroundColor:Colors.white,textColor:Colors.black);
    }catch(e){
      Fluttertoast.showToast(
                                                msg: ' Erreur: \n $e',
                                                toastLength: Toast.LENGTH_LONG,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white);
    } 
  }

  void updateTerritoire(Territoire t) async {
    try{
    DBHelper db =DBHelper();
    var db_connection = await db.db;
    String query =
        'UPDATE ${DBHelper.territoireTable} SET ${DBHelper.colAdm1pcodet}=\'${t.colAdm1pcodet}\',${DBHelper.colTname}=\'${t.colTname}\',${DBHelper.colAdm2pcode}=\'${t.colAdm2pcode}\' WHERE ${DBHelper.colIdt}=${t.colIdt}';
    await db_connection.transaction((transaction) async {
      return await transaction.rawQuery(query);
    });
      Fluttertoast.showToast(msg:'Territoire modifiée',toastLength:Toast.LENGTH_SHORT,
                              backgroundColor:Colors.white,textColor:Colors.black);
     }catch(e){
      Fluttertoast.showToast(
                                                msg: ' Erreur: \n $e',
                                                toastLength: Toast.LENGTH_LONG,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white);
    } 
  }
}
